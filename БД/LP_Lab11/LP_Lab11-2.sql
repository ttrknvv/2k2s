----- курсор -----

use T_MyBase;

declare test cursor 
				for select t.[Название товара], t.Цена
					from ТОВАРЫ t
declare @name varchar(30) = '',
		@cost real;
open test;
fetch test into @name, @cost;
while @@fetch_status = 0
begin
	print('Название: ' + @name + ' Цена: ' + cast(@cost as varchar(10)) + ' BYN');
	fetch test into @name, @cost;
end
close test;

------- cursor local ------

declare test2 cursor local
				for select z.[ID товара], z.[Количество заказанного товара]
					from ЗАКАЗЫ z
declare @id int,
		@count int;
open test2;
fetch test2 into @id, @count;
print(cast(@id as varchar(2)) + ' ' + cast(@count as varchar(4)));
go
declare @id int,
		@count int;
fetch test2 into @id, @count;
print(cast(@id as varchar(2)) + ' ' + cast(@count as varchar(4)));
go;
close test2;

------- cursor global ------

declare test3 cursor global
				for select z.[ID товара], z.[Количество заказанного товара]
					from ЗАКАЗЫ z
declare @id int,
		@count int;
open test3;
fetch test3 into @id, @count;
print(cast(@id as varchar(2)) + ' ' + cast(@count as varchar(4)));
go
declare @id int,
		@count int;
fetch test3 into @id, @count;
print(cast(@id as varchar(2)) + ' ' + cast(@count as varchar(4)));
go
close test3;

------ cursor local static -----

declare test4 cursor local static
				for select z.Имя, z.Телефон
					from ЗАКАЗЧИКИ z
						
declare @nameZ varchar(50) = '',
		@number varchar(15) = '';

open test4;
print 'Количество строк: ' + cast(@@cursor_rows as varchar(5));
insert into ЗАКАЗЧИКИ
		values('static', 'local', 'cursor', 'DB', '12', '2', 1);
fetch test4 into @nameZ, @number;
while @@FETCH_STATUS = 0
begin
	print(@nameZ + ' ' + @number);
	fetch test4 into @nameZ, @number;
end;
close test4;
delete ЗАКАЗЧИКИ where ЗАКАЗЧИКИ.Фамилия like 'static'

---- cursor local dynamic

declare test5 cursor local dynamic
				for select z.Имя, z.Телефон
					from ЗАКАЗЧИКИ z
						
declare @nameZ varchar(50) = '',
		@number varchar(15) = '';

open test5;
print 'Количество строк: ' + cast(@@cursor_rows as varchar(5));
insert into ЗАКАЗЧИКИ
		values('static', 'local', 'cursor', 'DB', '45', '2', 1);
fetch test5 into @nameZ, @number;
while @@FETCH_STATUS = 0
begin
	print(@nameZ + ' ' + @number);
	fetch test5 into @nameZ, @number;
end;
close test5;
delete ЗАКАЗЧИКИ where ЗАКАЗЧИКИ.Фамилия like 'static'

---- scroll ------

declare test6 cursor local dynamic scroll
				for select ROW_NUMBER() over(order by z.Телефон), z.Имя, z.Телефон
					from ЗАКАЗЧИКИ z
declare @nameZ varchar(50) = '',
		@number varchar(15) = '',
		@row int;

open test6;
fetch test6 into @row, @nameZ, @number;
print(cast(@row as varchar(3)) + ' ' + @nameZ + ' ' + @number);

fetch next from test6 into @row, @nameZ, @number;
print(cast(@row as varchar(3)) + ' ' + @nameZ + ' ' + @number);

fetch prior from test6 into @row, @nameZ, @number;
print(cast(@row as varchar(3)) + ' ' + @nameZ + ' ' + @number);

fetch absolute 3 from test6 into @row, @nameZ, @number;
print(cast(@row as varchar(3)) + ' ' + @nameZ + ' ' + @number);

fetch absolute -2 from test6 into @row, @nameZ, @number;
print(cast(@row as varchar(3)) + ' ' + @nameZ + ' ' + @number);

fetch relative 1 from test6 into @row, @nameZ, @number;
print(cast(@row as varchar(3)) + ' ' + @nameZ + ' ' + @number);

fetch relative -4 from test6 into @row, @nameZ, @number;
print(cast(@row as varchar(3)) + ' ' + @nameZ + ' ' + @number);

close test6;

------ current for update -----

insert into ЗАКАЗЧИКИ
		values('static', 'local', 'cursor', 'DB', '45', '2', 1);
declare test7 cursor local dynamic
				for select z.Имя, z.Фамилия
					from ЗАКАЗЧИКИ z
						where z.Имя like 'local';
declare @name varchar(15) = '',
		@lastname varchar(15) = '';

open test7;
fetch test7 into @name, @lastname;
print(@name + ' ' + @lastname);
update ЗАКАЗЧИКИ set Имя = 'update' where current of test7;
select z.Имя, z.Фамилия
					from ЗАКАЗЧИКИ z
						where z.Фамилия like 'static';
delete ЗАКАЗЧИКИ where current of test7;
select z.Имя, z.Фамилия
					from ЗАКАЗЧИКИ z
						where z.Фамилия like 'static';
close test7;
