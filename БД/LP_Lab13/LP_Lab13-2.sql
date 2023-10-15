------ ���������� �������� �������� --------

----- 1 ������� ------

use T_MyBase;

go

create procedure PTOVAR
as
begin
	declare GetStr cursor local static 
		for select s.[ID ������], s.[���������� �� ������], s.[�������� ������], S.���� from ������ s;
	declare @countStr int = (select count(*) from ������),
			@id int,
			@countT int,
			@nameT varchar(50) = '',
			@price int,
			@N int = 1;
	print('N' + space(3) + 'ID' + space(8) + '���������� �� ������' + space(4) + '�������� ������' + space(15) + '����');
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
print('���������� �����: ' + cast(@ret as varchar(3)));

drop procedure PTOVAR;

----- 2 ������� ------

--- ������������ �������� -> TARAKANOVNS -> T_MyBase -> ���������������� -> �������� ���������

alter procedure PTOVAR @p int = null, @c int output
as
begin
	print('���������: @p = ' + cast(@p as varchar(3)) + ' @c = ' + cast(@c as varchar(3)));
	declare GetStr cursor local static 
		for select s.[ID ������], s.[���������� �� ������], s.[�������� ������], S.���� from ������ s;
	declare @countStr int = (select count(*) from ������),
			@id int,
			@countT int,
			@nameT varchar(50) = '',
			@price int,
			@N int = 1;
	print('N' + space(3) + 'ID' + space(8) + '���������� �� ������' + space(4) + '�������� ������' + space(15) + '����');
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
print('���������� ������� �����: ' + cast(@ret as varchar(3)));
print('���������� ���������� ������� � id ' + cast(@p as varchar(3)) + ' : ' + cast(@k as varchar(3)));

---- 3 ������� ----

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
	print('���������: @p = ' + cast(@p as varchar(3)));
	declare @count int = (select count(*) from ������),
			@count2 int = (select count(*) from ������ s where s.[ID ������] = @p);
	print('�� ' + cast(@count as varchar(3)) + ' ������� �������� ' + cast(@count2 as varchar(3)) + ' �������.');
	select * from ������ s where s.[ID ������] = @p;
end;

insert #TOVAR exec PTOVAR @p = 5;

select * from #TOVAR;

---- 4 ������� ----

create procedure PTOVAR_INSERT @a int, @b nvarchar(50), @c int = 0, @d real
as
begin
	begin try
		insert into ������([ID ������], [���������� �� ������], [�������� ������], ����)
					values(@a, @b, @c, @d);
		return 1;
	end try

	begin catch
		print('����� ������ : ' + cast(error_number() as varchar(6)));
		print('��������� : ' + error_message());
		print('������� : ' + cast(error_severity() as varchar(6)));
		print('����� : ' + cast(error_state() as varchar(8)));
		print('����� ������ : ' + cast(error_line() as varchar(8)));
		if(error_procedure() is not null)
		begin
			print('��� ��������� : ' + error_procedure());
		end;
		return -1;
	end catch
end;	

declare @inProc int;

exec @inProc = PTOVAR_INSERT @a = 1, @b = 'TOVAR1', @c = 40, @d = 33.4;
print('���������� ���������� ���������: ' + cast(@inProc as varchar(3)));
exec @inProc = PTOVAR_INSERT @a = 2, @b = 'TOVAR2', @c = 99, @d = 99.2;
print('���������� ���������� ���������: ' + cast(@inProc as varchar(3)));
exec @inProc = PTOVAR_INSERT @a = 44, @b = 'TOVAR3', @c = 100, @d = 199.4;
print('���������� ���������� ���������: ' + cast(@inProc as varchar(3)));
exec @inProc = PTOVAR_INSERT @a = 333, @b = 'TOVAR4', @c = 400, @d = 992.99;
print('���������� ���������� ���������: ' + cast(@inProc as varchar(3)));

select * from ������;

delete from ������ where [ID ������] = 333; 
delete from ������ d where [ID ������] = 44; 

---- 5 ������� ----

create procedure TOVAR_REPORT @p int
as
begin
	begin try
		declare subj cursor local static 
				for select s.[�������� ������] from ������ s where s.[ID ������] = @p;
		declare @count int = (select count(*) from ������ s where s.[ID ������] = @p),
				@resStr varchar(300) = '',
				@locSubj varchar(50) = '',
				@locCount int = 0;
		if(@count = 0)
		begin
			raiserror('������ � ����������!', 11, 1) --- 1 - ��������� 2 - �����������(0 - 25) 3 - ��������� ������
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
		print('������ ������� � id : ' + cast(@p as varchar(3)));
		print(space(3) + @resStr);
		return @count;
	end try

	begin catch
		print '������ � ����������!';
		if ERROR_PROCEDURE() is not null
		begin
			print '��� ��������� : ' + error_procedure();
		end;
		return @locCount;
	end catch
end;

declare @result int = 0;

exec @result = TOVAR_REPORT @p = 5;
print('���������� �������: ' + cast(@result as varchar(3)));

exec @result = TOVAR_REPORT @p = 12;
print('���������� �������: ' + cast(@result as varchar(3)));

drop procedure TOVAR_REPORT;

