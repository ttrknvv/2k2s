------ неявная транзакция ----

use T_MyBase;

if(exists(select * 
			from SYS.objects
				where object_id = object_id(N'dbo.temp')))
begin
	drop table temp
end;
declare @c int,
		@flag char = 'c';
set implicit_transactions on
create table temp
(
	name varchar(40)
);
insert temp
		values('Nikita'),
			  ('Nikita2'),
		      ('Nikita3');
set @c = (select count(*) from temp);
print 'Количество строк в таблице temp: ' + cast(@c as varchar(3));
if @flag = 'c'
begin
	commit;
end;
else
begin
	rollback;
end;
set implicit_transactions off

if exists(select * from sys.objects
			where object_id = object_id(N'dbo.temp'))
begin
	print('Таблица temp существует');
end;
else
begin
	print('Таблица temp не существует');
end;

---- свойство атомарности -----

begin try
	begin tran;
	delete ТОВАРЫ where ТОВАРЫ.[ID товара] > 20;
	update ТОВАРЫ set Цена = Цена + 10 where ТОВАРЫ.[ID товара] > 20;
	insert ТОВАРЫ([ID товара],[Количество на складе], [Название товара], Цена)
		values(1, 1, '2', 3);
	commit tran;
	print('Транзакция успешно выполнена');
end try
begin catch
	print 'Ошибка: ' + case
		when error_number() = 2627 and patindex('%ТОВАРЫ%', error_message()) > 0
		then 'Дублирование id'
		else 'Неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
		end;
	if @@TRANCOUNT > 0 
	begin
		rollback tran;
		print('Откат транзакции!');
	end;
end catch

---- point ----

declare @point varchar(32);
begin try
	begin tran;
	delete ТОВАРЫ where [ID товара] = 11;
	set @point = 'point1'; save tran @point;
	update ТОВАРЫ set Цена = Цена - 1 where [ID товара] = 3;
	set @point = 'point2'; save tran @point;
	insert ТОВАРЫ([ID товара], [Количество на складе], [Название товара], Цена)
			values(1, 2, '2', 2);
			set @point = 'point3'; save tran @point;
	commit tran;
	print('Фиксация транзакции');
end try
begin catch
	print 'Ошибка: ' + case when error_number() = 2627 and patindex('%ТОВАРЫ%', error_message()) > 0
							then 'Дублирование id!'
							else 'Неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
							end;
	if @@TRANCOUNT > 0
	begin
		print 'Контрольная точка: ' + @point;
		rollback tran @point;
		commit tran;
	end;
end catch;

----- read uncommited -----

------------------ А -----------------

set transaction isolation level read uncommitted
begin transaction ---- t1
select @@SPID, 'insert ТОВАРЫ' 'результат', * from ТОВАРЫ t where t.[ID товара] = 399;
select @@SPID, 'update ТОВАРЫ' 'результат', *
	from ТОВАРЫ t where t.[ID товара] = 399
commit; ---- t2

------------------ B -----------------

begin transaction
select @@SPID;
insert ТОВАРЫ([ID товара], [Количество на складе], [Название товара], Цена)
		values(399, 399, '399', 80);
update ТОВАРЫ set Цена = Цена * 9 where ТОВАРЫ.[ID товара] = 399; ---t1
rollback;---- t2

---- read committed ----

------------------ А -----------------

set transaction isolation level read committed
begin transaction
select count(*) from ТОВАРЫ t where t.[ID товара] = 30; --- t1 t2
select 'update ТОВАРЫ' 'result', count(*)
	from ТОВАРЫ where ТОВАРЫ.[ID товара] = 30;
commit;

------------------ B -----------------

begin transaction --- t1
update ТОВАРЫ set Цена = Цена - 1
	where ТОВАРЫ.[ID товара] = 30;
commit; ---- t2

------ repeatable read -----

------------------ А -----------------

set transaction isolation level repeatable read
begin transaction
select t.[ID товара] from ТОВАРЫ t where t.[ID товара] = 200; --- t1 t2
select case
when ТОВАРЫ.[Название товара] = 'tovar' then 'insert ТОВАРЫ' else ''
end[results], ТОВАРЫ.[Название товара]
	from ТОВАРЫ where ТОВАРЫ.[ID товара] = 200;
commit;

------------------ B -----------------

begin transaction -- t1

insert ТОВАРЫ([ID товара], [Количество на складе], [Название товара], Цена)
	values(200, 999, 'tovar', 30);
commit; --- t2

---- serializeble -----

------------------ А -----------------

set transaction isolation level serializable;
begin transaction
delete ТОВАРЫ where [ID товара] = 200;
insert ТОВАРЫ([ID товара], [Количество на складе], [Название товара], Цена)
	values(200, 3, '3 id', 6);
update ТОВАРЫ set Цена = Цена + 4 where [ID товара] = 3;
select ТОВАРЫ.Цена from ТОВАРЫ where [ID товара] = 200; -- t1
select ТОВАРЫ.Цена from ТОВАРЫ where [ID товара] = 200; --- t2
commit

------------------ B -----------------

begin transaction
delete ТОВАРЫ where id = 200;
insert ТОВАРЫ([ID товара], [Количество на складе], [Название товара], Цена)
	values(200, 3, '3 id', 6);
update ТОВАРЫ set Цена = Цена + 6 where [ID товара] = 200;
select ТОВАРЫ.Цена from ТОВАРЫ where [ID товара] = 3; -- t1
commit;
select ТОВАРЫ.Цена from ТОВАРЫ where [ID товара] = 3; -- t2

---- вложенные -----

begin transaction
	insert ТОВАРЫ([ID товара], [Количество на складе], [Название товара], Цена)
		values(101, 101, 'new value', 101);
	begin transaction
		update ТОВАРЫ set Цена = Цена + 69 where [ID товара] = 101;
		commit;
		if @@TRANCOUNT > 0 rollback;
	select
		(select count(*) from ТОВАРЫ where [ID товара] = 101)[Value]

select * from ТОВАРЫ where [ID товара] = 101

