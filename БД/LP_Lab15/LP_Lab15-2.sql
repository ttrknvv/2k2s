------ Применение триггеров -----

----- 1 задание -----

use T_MyBase;

create table TR_AUDIT
(
	ID int identity, -- номер
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')), -- DML оператор
	TRNAME varchar(50), -- имя триггера
	CC varchar(300) -- комментарий
)

create trigger TR_TOVAR_INS on ТОВАРЫ after INSERT
as
begin
	declare @a1 int = '',
			@a2 nvarchar(50) = '',
			@a3 int = '',
			@a4 real = '',
			@in varchar(300) = '';
	set @a1 = (select [ID товара] from inserted);
	set @a2 = (select [Название товара] from inserted);
	set @a3 = (select [Количество на складе] from inserted);
	set @a4 = (select Цена from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print 'Вставка значения в таблицу ТОВАРЫ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('INS', 'TR_TOVAR_INS', @in);
	return;
end; 

insert into ТОВАРЫ([Количество на складе], [Название товара], Цена)
			values(200, 'Яблоко', 20);

select * from TR_AUDIT;

drop trigger TR_TOVAR_INS;
delete TR_AUDIT;

--- 2 задание ---

create trigger TR_TOVAR_DEL on ТОВАРЫ after DELETE
as
begin
	declare @a1 int = '',
			@a2 nvarchar(50) = '',
			@a3 int = '',
			@a4 real = '',
			@in varchar(300) = '';
	set @a1 = (select [ID товара] from deleted);
	set @a2 = (select [Название товара] from deleted);
	set @a3 = (select [Количество на складе] from deleted);
	set @a4 = (select Цена from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print 'Удаление значения из таблицы ТОВАРЫ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('DEL', 'TR_TOVAR_DEL', @in);
	return;
end; 

delete ТОВАРЫ where [Название товара] = 'Яблоко';

select * from TR_AUDIT;

drop trigger TR_TOVAR_DEL;
delete TR_AUDIT;

----- 3 задание ----

create trigger TR_TOVAR_UPD on ТОВАРЫ after UPDATE
as
begin
	declare @a1 int = '',
			@a2 nvarchar(50) = '',
			@a3 int = '',
			@a4 real = '',
			@in varchar(300) = '';
	set @a1 = (select [ID товара] from deleted);
	set @a2 = (select [Название товара] from deleted);
	set @a3 = (select [Количество на складе] from deleted);
	set @a4 = (select Цена from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print 'Удаление значения из таблицы ТОВАРЫ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('UPD', 'TR_TOVAR_UPD', @in);

	set @a1 = (select [ID товара] from inserted);
	set @a2 = (select [Название товара] from inserted);
	set @a3 = (select [Количество на складе] from inserted);
	set @a4 = (select Цена from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print 'Вставка значения в таблицу ТОВАРЫ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('UPD', 'TR_TOVAR_UPD', @in);
	return;
end; 

insert into ТОВАРЫ([Количество на складе], [Название товара], Цена)
			values(200, 'Яблоко', 20);
update ТОВАРЫ set [Название товара] = 'Апельсин' where [Название товара] = 'Яблоко'

select * from TR_AUDIT

drop trigger TR_TOVAR_UPD;

--- 4 задание -----

create trigger TR_TOVAR_FULL on ТОВАРЫ after INSERT, DELETE, UPDATE
as
begin
	declare @ins int = (select count(*) from inserted);
	declare @del int = (select count(*) from deleted);
	declare @a1 int = '',
			@a2 nvarchar(50) = '',
			@a3 int = '',
			@a4 real = '',
			@in varchar(300) = '';
	if @ins > 0 and @del = 0
	begin
		set @a1 = (select [ID товара] from inserted);
		set @a2 = (select [Название товара] from inserted);
		set @a3 = (select [Количество на складе] from inserted);
		set @a4 = (select Цена from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print 'Вставка значения в таблицу ТОВАРЫ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('INS', 'TR_TOVAR_FULL', @in);
	end;

	else if @del > 0 and @ins = 0
	begin
		set @a1 = (select [ID товара] from deleted);
		set @a2 = (select [Название товара] from deleted);
		set @a3 = (select [Количество на складе] from deleted);
		set @a4 = (select Цена from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print 'Удаление значения из таблицы ТОВАРЫ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('DEL', 'TR_TOVAR_FULL', @in);
	end;

	else if @del > 0 and @ins > 0
	begin
		set @a1 = (select [ID товара] from deleted);
		set @a2 = (select [Название товара] from deleted);
		set @a3 = (select [Количество на складе] from deleted);
		set @a4 = (select Цена from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print 'Удаление значения из таблицы ТОВАРЫ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('UPD', 'TR_TOVAR_FULL', @in);

		set @a1 = (select [ID товара] from inserted);
		set @a2 = (select [Название товара] from inserted);
		set @a3 = (select [Количество на складе] from inserted);
		set @a4 = (select Цена from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print 'Вставка значения в таблицу ТОВАРЫ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('UPD', 'TR_TOVAR_FULL', @in);
	end;
	return;
end;

insert ТОВАРЫ([Количество на складе], [Название товара], Цена)
			values(500, 'trigger', 40);

delete ТОВАРЫ where [Название товара] = 'trigger';

update ТОВАРЫ set Цена = Цена + 10 where [Название товара] = '%iph%'

select * from TR_AUDIT

drop trigger TR_TOVAR_FULL;

---- 6 задание ---

create trigger AT_TRIG on ТОВАРЫ after insert, delete, update
as
begin
	declare @count int = (select count(*) from ТОВАРЫ);
	if(@count > 11)
	begin
		raiserror('Общее количество записей не может быть больше 11!', 11 , 1);
	end;
	rollback;
	return;
end;

insert ТОВАРЫ([Количество на складе], [Название товара], Цена)
			values(500, 'trigger', 40);

drop trigger AT_TRIG;

--- 7 задание ----

create trigger TR_TOV2 on ТОВАРЫ instead of DELETE
as
begin
	raiserror('Удаление строк в таблице ТОВАРЫ запрещено!', 11, 1);
	return;
end;

delete ТОВАРЫ where [Название товара] = 'Апельсин'

drop trigger TR_TOV2;

--- 8 задание ---

create trigger DDL_TOVARI on database for DDL_DATABASE_LEVEL_EVENTS
as begin
	declare @t  varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
	declare @t1  varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
	declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');

	if(@t != 'ALTER_TABLE')
	begin
	print('Тип события : ' + @t);
	print('Имя объекта : ' + @t1);
	print('Тип объекта : ' + @t2);
	raiserror('Операции удаления и создания таблиц в базе данных ТОВАРЫ запрещена!', 18, 1);
	rollback;
	end;
	return;
end;

create table TTTe2
(
id int
)

drop table temp;

alter table ТОВАРЫ add IDD int;
alter table ТОВАРЫ drop column IDD;

drop trigger DDL_TOVARI on database;



