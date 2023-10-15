------ ���������� ��������� -----

----- 1 ������� -----

use T_MyBase;

create table TR_AUDIT
(
	ID int identity, -- �����
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')), -- DML ��������
	TRNAME varchar(50), -- ��� ��������
	CC varchar(300) -- �����������
)

create trigger TR_TOVAR_INS on ������ after INSERT
as
begin
	declare @a1 int = '',
			@a2 nvarchar(50) = '',
			@a3 int = '',
			@a4 real = '',
			@in varchar(300) = '';
	set @a1 = (select [ID ������] from inserted);
	set @a2 = (select [�������� ������] from inserted);
	set @a3 = (select [���������� �� ������] from inserted);
	set @a4 = (select ���� from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print '������� �������� � ������� ������ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('INS', 'TR_TOVAR_INS', @in);
	return;
end; 

insert into ������([���������� �� ������], [�������� ������], ����)
			values(200, '������', 20);

select * from TR_AUDIT;

drop trigger TR_TOVAR_INS;
delete TR_AUDIT;

--- 2 ������� ---

create trigger TR_TOVAR_DEL on ������ after DELETE
as
begin
	declare @a1 int = '',
			@a2 nvarchar(50) = '',
			@a3 int = '',
			@a4 real = '',
			@in varchar(300) = '';
	set @a1 = (select [ID ������] from deleted);
	set @a2 = (select [�������� ������] from deleted);
	set @a3 = (select [���������� �� ������] from deleted);
	set @a4 = (select ���� from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print '�������� �������� �� ������� ������ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('DEL', 'TR_TOVAR_DEL', @in);
	return;
end; 

delete ������ where [�������� ������] = '������';

select * from TR_AUDIT;

drop trigger TR_TOVAR_DEL;
delete TR_AUDIT;

----- 3 ������� ----

create trigger TR_TOVAR_UPD on ������ after UPDATE
as
begin
	declare @a1 int = '',
			@a2 nvarchar(50) = '',
			@a3 int = '',
			@a4 real = '',
			@in varchar(300) = '';
	set @a1 = (select [ID ������] from deleted);
	set @a2 = (select [�������� ������] from deleted);
	set @a3 = (select [���������� �� ������] from deleted);
	set @a4 = (select ���� from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print '�������� �������� �� ������� ������ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('UPD', 'TR_TOVAR_UPD', @in);

	set @a1 = (select [ID ������] from inserted);
	set @a2 = (select [�������� ������] from inserted);
	set @a3 = (select [���������� �� ������] from inserted);
	set @a4 = (select ���� from inserted);
	set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
	print '������� �������� � ������� ������ : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('UPD', 'TR_TOVAR_UPD', @in);
	return;
end; 

insert into ������([���������� �� ������], [�������� ������], ����)
			values(200, '������', 20);
update ������ set [�������� ������] = '��������' where [�������� ������] = '������'

select * from TR_AUDIT

drop trigger TR_TOVAR_UPD;

--- 4 ������� -----

create trigger TR_TOVAR_FULL on ������ after INSERT, DELETE, UPDATE
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
		set @a1 = (select [ID ������] from inserted);
		set @a2 = (select [�������� ������] from inserted);
		set @a3 = (select [���������� �� ������] from inserted);
		set @a4 = (select ���� from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print '������� �������� � ������� ������ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('INS', 'TR_TOVAR_FULL', @in);
	end;

	else if @del > 0 and @ins = 0
	begin
		set @a1 = (select [ID ������] from deleted);
		set @a2 = (select [�������� ������] from deleted);
		set @a3 = (select [���������� �� ������] from deleted);
		set @a4 = (select ���� from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print '�������� �������� �� ������� ������ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('DEL', 'TR_TOVAR_FULL', @in);
	end;

	else if @del > 0 and @ins > 0
	begin
		set @a1 = (select [ID ������] from deleted);
		set @a2 = (select [�������� ������] from deleted);
		set @a3 = (select [���������� �� ������] from deleted);
		set @a4 = (select ���� from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print '�������� �������� �� ������� ������ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('UPD', 'TR_TOVAR_FULL', @in);

		set @a1 = (select [ID ������] from inserted);
		set @a2 = (select [�������� ������] from inserted);
		set @a3 = (select [���������� �� ������] from inserted);
		set @a4 = (select ���� from inserted);
		set @in = concat(cast(@a1 as varchar(3)), ' ', @a2, ' ', cast(@a3 as varchar(6)), ' ', cast(@a4 as varchar(10)));
		print '������� �������� � ������� ������ : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
					values('UPD', 'TR_TOVAR_FULL', @in);
	end;
	return;
end;

insert ������([���������� �� ������], [�������� ������], ����)
			values(500, 'trigger', 40);

delete ������ where [�������� ������] = 'trigger';

update ������ set ���� = ���� + 10 where [�������� ������] = '%iph%'

select * from TR_AUDIT

drop trigger TR_TOVAR_FULL;

---- 6 ������� ---

create trigger AT_TRIG on ������ after insert, delete, update
as
begin
	declare @count int = (select count(*) from ������);
	if(@count > 11)
	begin
		raiserror('����� ���������� ������� �� ����� ���� ������ 11!', 11 , 1);
	end;
	rollback;
	return;
end;

insert ������([���������� �� ������], [�������� ������], ����)
			values(500, 'trigger', 40);

drop trigger AT_TRIG;

--- 7 ������� ----

create trigger TR_TOV2 on ������ instead of DELETE
as
begin
	raiserror('�������� ����� � ������� ������ ���������!', 11, 1);
	return;
end;

delete ������ where [�������� ������] = '��������'

drop trigger TR_TOV2;

--- 8 ������� ---

create trigger DDL_TOVARI on database for DDL_DATABASE_LEVEL_EVENTS
as begin
	declare @t  varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
	declare @t1  varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
	declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');

	if(@t != 'ALTER_TABLE')
	begin
	print('��� ������� : ' + @t);
	print('��� ������� : ' + @t1);
	print('��� ������� : ' + @t2);
	raiserror('�������� �������� � �������� ������ � ���� ������ ������ ���������!', 18, 1);
	rollback;
	end;
	return;
end;

create table TTTe2
(
id int
)

drop table temp;

alter table ������ add IDD int;
alter table ������ drop column IDD;

drop trigger DDL_TOVARI on database;



