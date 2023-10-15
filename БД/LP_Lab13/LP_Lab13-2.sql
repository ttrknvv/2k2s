------ Разработка хранимых процедур --------

----- 1 задание ------

use T_MyBase;

go

create procedure PTOVAR
as
begin
	declare GetStr cursor local static 
		for select s.[ID товара], s.[Количество на складе], s.[Название товара], S.Цена from ТОВАРЫ s;
	declare @countStr int = (select count(*) from ТОВАРЫ),
			@id int,
			@countT int,
			@nameT varchar(50) = '',
			@price int,
			@N int = 1;
	print('N' + space(3) + 'ID' + space(8) + 'Количество на складе' + space(4) + 'Название товара' + space(15) + 'Цена');
	open GetStr;
	fetch GetStr into @id, @countT, @nameT, @price;
	while(@@FETCH_STATUS = 0)
	begin
		print(cast(@N as varchar(3)) + space(4 - len(cast(@N as varchar(3)))) + 
			  cast(@id as varchar(9)) + space(10 - len(trim(cast(@id as varchar(9))))) + 
			  cast(@countT as varchar(23)) + space(24 - len(cast(@countT as varchar(23)))) + 
			  trim(@nameT) + space(30 - len(trim(@nameT))) + cast(@price as varchar(10)) + ' BYN');
		fetch GetStr into @id, @countT, @nameT, @price;
		set @N = @N + 1;
	end;
	close GetStr;
	return @countStr;
end;

declare @ret int = 0;

exec @ret = PTOVAR;
print('Количество строк: ' + cast(@ret as varchar(3)));

drop procedure PTOVAR;

----- 2 задание ------

--- обозреватель объектов -> TARAKANOVNS -> T_MyBase -> Программирование -> Хранимые процедуры

alter procedure PTOVAR @p int = null, @c int output
as
begin
	print('Параметры: @p = ' + cast(@p as varchar(3)) + ' @c = ' + cast(@c as varchar(3)));
	declare GetStr cursor local static 
		for select s.[ID товара], s.[Количество на складе], s.[Название товара], S.Цена from ТОВАРЫ s;
	declare @countStr int = (select count(*) from ТОВАРЫ),
			@id int,
			@countT int,
			@nameT varchar(50) = '',
			@price int,
			@N int = 1;
	print('N' + space(3) + 'ID' + space(8) + 'Количество на складе' + space(4) + 'Название товара' + space(15) + 'Цена');
	open GetStr;
	fetch GetStr into @id, @countT, @nameT, @price;
	while(@@FETCH_STATUS = 0)
	begin
		if(@p = @id)
		begin
			print(cast(@N as varchar(3)) + space(4 - len(cast(@N as varchar(3)))) + 
			  cast(@id as varchar(9)) + space(10 - len(trim(cast(@id as varchar(9))))) + 
			  cast(@countT as varchar(23)) + space(24 - len(cast(@countT as varchar(23)))) + 
			  trim(@nameT) + space(30 - len(trim(@nameT))) + cast(@price as varchar(10)) + ' BYN');
			set @c = @c + 1;
			set @N = @N + 1;
		end;
		fetch GetStr into @id, @countT, @nameT, @price;
	end;
	close GetStr;
	return @countStr;
end;

declare @ret int = 0,
		@k int = 0,
		@p int = 5;
exec @ret = PTOVAR @p = 5, @c = @k output
print('Количество товаров всего: ' + cast(@ret as varchar(3)));
print('Количество полученных товаров с id ' + cast(@p as varchar(3)) + ' : ' + cast(@k as varchar(3)));

---- 3 задание ----

create table #TOVAR
(
	id_T int primary key,
	name_T varchar(50),
	count_T int,
	price real
)

alter procedure PTOVAR @p int = null
as
begin
	print('Параметры: @p = ' + cast(@p as varchar(3)));
	declare @count int = (select count(*) from ТОВАРЫ),
			@count2 int = (select count(*) from ТОВАРЫ s where s.[ID товара] = @p);
	print('Из ' + cast(@count as varchar(3)) + ' записей подходит ' + cast(@count2 as varchar(3)) + ' записей.');
	select * from ТОВАРЫ s where s.[ID товара] = @p;
end;

insert #TOVAR exec PTOVAR @p = 5;

select * from #TOVAR;

---- 4 задание ----

create procedure PTOVAR_INSERT @a int, @b nvarchar(50), @c int = 0, @d real
as
begin
	begin try
		insert into ТОВАРЫ([ID товара], [Количество на складе], [Название товара], Цена)
					values(@a, @b, @c, @d);
		return 1;
	end try

	begin catch
		print('Номер ошибки : ' + cast(error_number() as varchar(6)));
		print('Сообщение : ' + error_message());
		print('Уровень : ' + cast(error_severity() as varchar(6)));
		print('Метка : ' + cast(error_state() as varchar(8)));
		print('Номер строки : ' + cast(error_line() as varchar(8)));
		if(error_procedure() is not null)
		begin
			print('Имя процедуры : ' + error_procedure());
		end;
		return -1;
	end catch
end;	

declare @inProc int;

exec @inProc = PTOVAR_INSERT @a = 1, @b = 'TOVAR1', @c = 40, @d = 33.4;
print('Успешность выполнения процедуры: ' + cast(@inProc as varchar(3)));
exec @inProc = PTOVAR_INSERT @a = 2, @b = 'TOVAR2', @c = 99, @d = 99.2;
print('Успешность выполнения процедуры: ' + cast(@inProc as varchar(3)));
exec @inProc = PTOVAR_INSERT @a = 44, @b = 'TOVAR3', @c = 100, @d = 199.4;
print('Успешность выполнения процедуры: ' + cast(@inProc as varchar(3)));
exec @inProc = PTOVAR_INSERT @a = 333, @b = 'TOVAR4', @c = 400, @d = 992.99;
print('Успешность выполнения процедуры: ' + cast(@inProc as varchar(3)));

select * from ТОВАРЫ;

delete from ТОВАРЫ where [ID товара] = 333; 
delete from ТОВАРЫ d where [ID товара] = 44; 

---- 5 задание ----

create procedure TOVAR_REPORT @p int
as
begin
	begin try
		declare subj cursor local static 
				for select s.[Название товара] from ТОВАРЫ s where s.[ID товара] = @p;
		declare @count int = (select count(*) from ТОВАРЫ s where s.[ID товара] = @p),
				@resStr varchar(300) = '',
				@locSubj varchar(50) = '',
				@locCount int = 0;
		if(@count = 0)
		begin
			raiserror('Ошибка в параметрах!', 11, 1) --- 1 - сообщение 2 - серьезность(0 - 25) 3 - состояние ошибки
		end;
		open subj;
		fetch subj into @locSubj;
		while(@@FETCH_STATUS = 0)
		begin
			set @resStr = concat(trim(@locSubj), ', ', @resStr);
			fetch subj into @locSubj;
			set @locCount = @locCount + 1;  
		end;
		close subj;
		print('Список товаров с id : ' + cast(@p as varchar(3)));
		print(space(3) + @resStr);
		return @count;
	end try

	begin catch
		print 'Ошибка в параметрах!';
		if ERROR_PROCEDURE() is not null
		begin
			print 'Имя процедуры : ' + error_procedure();
		end;
		return @locCount;
	end catch
end;

declare @result int = 0;

exec @result = TOVAR_REPORT @p = 5;
print('Количество товаров: ' + cast(@result as varchar(3)));

exec @result = TOVAR_REPORT @p = 12;
print('Количество товаров: ' + cast(@result as varchar(3)));

drop procedure TOVAR_REPORT;

