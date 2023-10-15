------ ������� ���������� ----

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
print '���������� ����� � ������� temp: ' + cast(@c as varchar(3));
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
	print('������� temp ����������');
end;
else
begin
	print('������� temp �� ����������');
end;

---- �������� ����������� -----

begin try
	begin tran;
	delete ������ where ������.[ID ������] > 20;
	update ������ set ���� = ���� + 10 where ������.[ID ������] > 20;
	insert ������([ID ������],[���������� �� ������], [�������� ������], ����)
		values(1, 1, '2', 3);
	commit tran;
	print('���������� ������� ���������');
end try
begin catch
	print '������: ' + case
		when error_number() = 2627 and patindex('%������%', error_message()) > 0
		then '������������ id'
		else '����������� ������: ' + cast(error_number() as varchar(5)) + error_message()
		end;
	if @@TRANCOUNT > 0 
	begin
		rollback tran;
		print('����� ����������!');
	end;
end catch

---- point ----

declare @point varchar(32);
begin try
	begin tran;
	delete ������ where [ID ������] = 11;
	set @point = 'point1'; save tran @point;
	update ������ set ���� = ���� - 1 where [ID ������] = 3;
	set @point = 'point2'; save tran @point;
	insert ������([ID ������], [���������� �� ������], [�������� ������], ����)
			values(1, 2, '2', 2);
			set @point = 'point3'; save tran @point;
	commit tran;
	print('�������� ����������');
end try
begin catch
	print '������: ' + case when error_number() = 2627 and patindex('%������%', error_message()) > 0
							then '������������ id!'
							else '����������� ������: ' + cast(error_number() as varchar(5)) + error_message()
							end;
	if @@TRANCOUNT > 0
	begin
		print '����������� �����: ' + @point;
		rollback tran @point;
		commit tran;
	end;
end catch;

----- read uncommited -----

------------------ � -----------------

set transaction isolation level read uncommitted
begin transaction ---- t1
select @@SPID, 'insert ������' '���������', * from ������ t where t.[ID ������] = 399;
select @@SPID, 'update ������' '���������', *
	from ������ t where t.[ID ������] = 399
commit; ---- t2

------------------ B -----------------

begin transaction
select @@SPID;
insert ������([ID ������], [���������� �� ������], [�������� ������], ����)
		values(399, 399, '399', 80);
update ������ set ���� = ���� * 9 where ������.[ID ������] = 399; ---t1
rollback;---- t2

---- read committed ----

------------------ � -----------------

set transaction isolation level read committed
begin transaction
select count(*) from ������ t where t.[ID ������] = 30; --- t1 t2
select 'update ������' 'result', count(*)
	from ������ where ������.[ID ������] = 30;
commit;

------------------ B -----------------

begin transaction --- t1
update ������ set ���� = ���� - 1
	where ������.[ID ������] = 30;
commit; ---- t2

------ repeatable read -----

------------------ � -----------------

set transaction isolation level repeatable read
begin transaction
select t.[ID ������] from ������ t where t.[ID ������] = 200; --- t1 t2
select case
when ������.[�������� ������] = 'tovar' then 'insert ������' else ''
end[results], ������.[�������� ������]
	from ������ where ������.[ID ������] = 200;
commit;

------------------ B -----------------

begin transaction -- t1

insert ������([ID ������], [���������� �� ������], [�������� ������], ����)
	values(200, 999, 'tovar', 30);
commit; --- t2

---- serializeble -----

------------------ � -----------------

set transaction isolation level serializable;
begin transaction
delete ������ where [ID ������] = 200;
insert ������([ID ������], [���������� �� ������], [�������� ������], ����)
	values(200, 3, '3 id', 6);
update ������ set ���� = ���� + 4 where [ID ������] = 3;
select ������.���� from ������ where [ID ������] = 200; -- t1
select ������.���� from ������ where [ID ������] = 200; --- t2
commit

------------------ B -----------------

begin transaction
delete ������ where id = 200;
insert ������([ID ������], [���������� �� ������], [�������� ������], ����)
	values(200, 3, '3 id', 6);
update ������ set ���� = ���� + 6 where [ID ������] = 200;
select ������.���� from ������ where [ID ������] = 3; -- t1
commit;
select ������.���� from ������ where [ID ������] = 3; -- t2

---- ��������� -----

begin transaction
	insert ������([ID ������], [���������� �� ������], [�������� ������], ����)
		values(101, 101, 'new value', 101);
	begin transaction
		update ������ set ���� = ���� + 69 where [ID ������] = 101;
		commit;
		if @@TRANCOUNT > 0 rollback;
	select
		(select count(*) from ������ where [ID ������] = 101)[Value]

select * from ������ where [ID ������] = 101

