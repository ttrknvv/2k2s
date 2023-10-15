------ ���������� ��������� -----

----- 1 ������� -----

use UNIVER;

create table TR_AUDIT
(
	ID int identity, -- �����
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')), -- DML ��������
	TRNAME varchar(50), -- ��� ��������
	CC varchar(300) -- �����������
)

create trigger TR_TEACHERS_INS on TEACHER after INSERT
as
begin
	declare @a1 char(10) = '',
			@a2 varchar(100) = '',
			@a3 char(1) = '',
			@a4 char(20) = '',
			@in varchar(300) = '';
	set @a1 = (select [TEACHER] from inserted);
	set @a2 = (select [TEACHER_NAME] from inserted);
	set @a3 = (select [GENDER] from inserted);
	set @a4 = (select [PULPIT] from inserted);
	set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
	print '������� �������� � ������� TEACHER : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('INS', 'TR_TEACHERS_INS', @in);
	return;
end; 

insert into TEACHER(GENDER, PULPIT, TEACHER, TEACHER_NAME)
			values('�', '����', '���', '��������� ������ ���������');

select * from TR_AUDIT;

drop trigger TR_TEACHERS_INS;
delete TR_AUDIT;


----- 2 ������� ----

create trigger TR_TEACHERS_DEL on TEACHER after DELETE
as
begin
	declare @a1 char(10) = '',
			@a2 varchar(100) = '',
			@a3 char(1) = '',
			@a4 char(20) = '',
			@in varchar(300) = '';
	set @a1 = (select [TEACHER] from deleted);
	set @a2 = (select [TEACHER_NAME] from deleted);
	set @a3 = (select [GENDER] from deleted);
	set @a4 = (select [PULPIT] from deleted);
	set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
	print '�������� �������� �� ������� TEACHER : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('DEL', 'TR_TEACHERS_DEL', @in);
	return;
end; 

delete TEACHER where TEACHER like '���';
select * from TR_AUDIT;

drop trigger TR_TEACHERS_DEL;
delete TR_AUDIT;

------ 3 ������� -----

create trigger TR_TEACHERS_UPD on TEACHER after UPDATE
as
begin
	declare @a1 char(10) = '',
			@a2 varchar(100) = '',
			@a3 char(1) = '',
			@a4 char(20) = '',
			@in varchar(300) = '';
	set @a1 = (select [TEACHER] from deleted);
	set @a2 = (select [TEACHER_NAME] from deleted);
	set @a3 = (select [GENDER] from deleted);
	set @a4 = (select [PULPIT] from deleted);
	set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
	print '�������� �������� �� ������� TEACHER : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('DEL', 'TR_TEACHERS_UPD', @in);
	set @a1 = (select [TEACHER] from inserted);
	set @a2 = (select [TEACHER_NAME] from inserted);
	set @a3 = (select [GENDER] from inserted);
	set @a4 = (select [PULPIT] from inserted);
	set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
	print '������� �������� � ������� TEACHER : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('INS', 'TR_TEACHERS_UPD', @in);
	return;
end; 

insert TEACHER(GENDER, PULPIT, TEACHER, TEACHER_NAME)
		values('�', '��', '���', '���������� ���������� ���������');
update TEACHER set TEACHER = '���' where TEACHER = '���';
update TEACHER set TEACHER_NAME = '���������� ������� ����������'  where TEACHER = '���';

delete TEACHER where TEACHER = '���';

select * from TR_AUDIT;

drop trigger TR_TEACHERS_UPD;
delete TR_AUDIT;

--- 4 ������� ----

create trigger TR_TEACHER on TEACHER after INSERT, DELETE, UPDATE
as
begin
	declare @a1 char(10) = '',
			@a2 varchar(100) = '',
			@a3 char(1) = '',
			@a4 char(20) = '',
			@in varchar(300) = '',
			@ins int = (select count(*) from inserted),
			@del int = (select count(*) from deleted);

	if @ins > 0 and @del = 0
	begin
		set @a1 = (select [TEACHER] from inserted);
		set @a2 = (select [TEACHER_NAME] from inserted);
		set @a3 = (select [GENDER] from inserted);
		set @a4 = (select [PULPIT] from inserted);
		set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
		print '������� �������� � ������� TEACHER(INSERT) : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
							values('INS', 'TR_TEACHERS', @in);
	end;

	else if @del > 0 and @ins = 0
	begin
		set @a1 = (select [TEACHER] from deleted);
		set @a2 = (select [TEACHER_NAME] from deleted);
		set @a3 = (select [GENDER] from deleted);
		set @a4 = (select [PULPIT] from deleted);
		set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
		print '�������� �������� �� ������� TEACHER(DELETE) : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
						values('DEL', 'TR_TEACHERS', @in);
	end;

	else if @del > 0 and @ins > 0
	begin
		set @a1 = (select [TEACHER] from deleted);
		set @a2 = (select [TEACHER_NAME] from deleted);
		set @a3 = (select [GENDER] from deleted);
		set @a4 = (select [PULPIT] from deleted);
		set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
		print '������ �������� �� ������� TEACHER(UPDATE) : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
						values('DEL', 'TR_TEACHERS', @in);
		set @a1 = (select [TEACHER] from inserted);
		set @a2 = (select [TEACHER_NAME] from inserted);
		set @a3 = (select [GENDER] from inserted);
		set @a4 = (select [PULPIT] from inserted);
		set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
		print '�� �������� : ' + @in;
		insert into TR_AUDIT(STMT, TRNAME, CC)
							values('INS', 'TR_TEACHERS', @in);
	end;
	return;
end;

insert into TEACHER(GENDER, PULPIT, TEACHER, TEACHER_NAME)
			values('�', '����', '���', '��������� ������ ���������');
insert TEACHER(GENDER, PULPIT, TEACHER, TEACHER_NAME)
		values('�', '��', '���', '���������� ���������� ���������');

update TEACHER set TEACHER = '���' where TEACHER = '���';
update TEACHER set TEACHER_NAME = '���������� ������� ����������'  where TEACHER = '���';

delete TEACHER where TEACHER = '���';
delete TEACHER where TEACHER = '���';

select * from TR_AUDIT;

drop trigger TR_TEACHER;
delete TR_AUDIT;

---- 5 ������� ----

insert TEACHER(GENDER, PULPIT, TEACHER, TEACHER_NAME)
		values('r', '��', '���', '���������� ���������� ���������');

select * from TR_AUDIT;

--- 6 ������� ----

create trigger TR_TEACHERS_DEL1 on TEACHER after DELETE
as
begin
	declare @a1 char(10) = '',
			@a2 varchar(100) = '',
			@a3 char(1) = '',
			@a4 char(20) = '',
			@in varchar(300) = '';
	set @a1 = (select [TEACHER] from deleted);
	set @a2 = (select [TEACHER_NAME] from deleted);
	set @a3 = (select [GENDER] from deleted);
	set @a4 = (select [PULPIT] from deleted);
	set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
	print '�������� �������� �� ������� TEACHER(1) : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('DEL', 'TR_TEACHERS_DEL1', @in);
	return;
end;

create trigger TR_TEACHERS_DEL2 on TEACHER after DELETE
as
begin
	declare @a1 char(10) = '',
			@a2 varchar(100) = '',
			@a3 char(1) = '',
			@a4 char(20) = '',
			@in varchar(300) = '';
	set @a1 = (select [TEACHER] from deleted);
	set @a2 = (select [TEACHER_NAME] from deleted);
	set @a3 = (select [GENDER] from deleted);
	set @a4 = (select [PULPIT] from deleted);
	set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
	print '�������� �������� �� ������� TEACHER(2) : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('DEL', 'TR_TEACHERS_DEL2', @in);
	return;
end;

create trigger TR_TEACHERS_DEL3 on TEACHER after DELETE
as
begin
	declare @a1 char(10) = '',
			@a2 varchar(100) = '',
			@a3 char(1) = '',
			@a4 char(20) = '',
			@in varchar(300) = '';
	set @a1 = (select [TEACHER] from deleted);
	set @a2 = (select [TEACHER_NAME] from deleted);
	set @a3 = (select [GENDER] from deleted);
	set @a4 = (select [PULPIT] from deleted);
	set @in = concat(trim(@a1), ' ', @a2, ' ', @a3, ' ', @a4);
	print '�������� �������� �� ������� TEACHER(3) : ' + @in;
	insert into TR_AUDIT(STMT, TRNAME, CC)
				values('DEL', 'TR_TEACHERS_DEL3', @in);
	return;
end;

-- �������� ������ ���������

select t.name
	from sys.triggers t
		where OBJECT_NAME(t.parent_id) = 'TEACHER'

--- �������� ������� ���������� ��������

select t.name, e.type_desc
	from sys.triggers t join sys.trigger_events e
		on t.object_id = e.object_id
		where OBJECT_NAME(t.parent_id) = 'TEACHER' and e.type_desc = 'DELETE'

--- �������� ������� ���������� ���������

exec sp_settriggerorder @triggername = 'TR_TEACHERS_DEL3', @order = 'First', @stmttype = 'DELETE';
exec sp_settriggerorder @triggername = 'TR_TEACHERS_DEL2', @order = 'Last', @stmttype = 'DELETE';

insert into TEACHER(GENDER, PULPIT, TEACHER, TEACHER_NAME)
			values('�', '����', '���', '��������� ������ ���������');
delete TEACHER where TEACHER = '���';

drop trigger TR_TEACHERS_DEL3, TR_TEACHERS_DEL2, TR_TEACHERS_DEL1;

---- 7 ������� ----

create trigger AT_TRIG on AUDITORIUM_TYPE after insert, delete, update
as
begin
	declare @count int = (select count(*) from AUDITORIUM_TYPE);
	if(@count > 5)
	begin
		raiserror('����� ���������� ������� �� ����� ���� ������ 5!', 11 , 1);
	end;
	rollback;
	return;
end;

begin tran
insert AUDITORIUM_TYPE
		values('1', '2');
commit;

select * from AUDITORIUM_TYPE;

drop trigger AT_TRIG;

--- 8 ������� ---

create trigger FAC_TRIG on FACULTY instead of DELETE
as
begin
	raiserror('�������� ����� � ������� FACULTY ���������!', 11, 1);
	return;
end;

delete FACULTY;
select * from FACULTY

drop trigger FAC_TRIG;

---- ������� ��� ��������

drop trigger TR_TEACHERS_INS, TR_TEACHERS_DEL, TR_TEACHERS_UPD, TR_TEACHER, 
			 TR_TEACHERS_DEL1, TR_TEACHERS_DEL2, TR_TEACHERS_DEL3, AT_TRIG, FAC_TRIG;

---- 9 ������� ----

create trigger DDL_UNIVER on database for DDL_DATABASE_LEVEL_EVENTS
as begin
	declare @t  varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
	declare @t1  varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
	declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');

	if(@t != 'ALTER_TABLE')
	begin
	print('��� ������� : ' + @t);
	print('��� ������� : ' + @t1);
	print('��� ������� : ' + @t2);
	raiserror('�������� �������� � �������� ������ � ���� ������ UNIVER ���������!', 18, 1);
	rollback;
	end;
	return;
end;

create table TTTe2
(
id int
)

drop table TIMETABLE;

alter table TIMETABLE add IDD int;
alter table TIMETABLE drop column IDD;

drop trigger DDL_UNIVER on database;






