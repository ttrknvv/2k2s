---- 4 ������� ----

---- ���������� � ------

---- ���������������� ������ ----
set transaction isolation level READ UNCOMMITTED 
begin transaction
select * from product where id_product = 1;
waitfor delay '00:00:03'
select * from product where id_product = 1;
commit
--------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
begin transaction
select * from product where id_product = 2;
waitfor delay '00:00:02'
select * from product where id_product = 2;
commit
--------------------
---- ��������� ������ ----
set transaction isolation level READ UNCOMMITTED 
begin transaction
select * from product where id_product = 4
waitfor delay '00:00:03'
select * from product where id_product = 4
commit
--------------------

---- 5 ������� ----

---- ���������� � ------

---- -���������������� ������ ----
set transaction isolation level READ COMMITTED 
begin transaction
select * from product where id_product = 1;
waitfor delay '00:00:03'
select * from product where id_product = 1;
commit
--------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin transaction
select * from product where id_product = 2;
waitfor delay '00:00:04'
select * from product where id_product = 2;
commit
--------------------
---- ��������� ������ ----
set transaction isolation level READ COMMITTED 
begin transaction
select * from product where id_product = 4
waitfor delay '00:00:03'
select * from product where id_product = 4
commit
--------------------

---- 6 ������� ----

---- ���������� � ------

---- -���������������� ������ ----
set transaction isolation level REPEATABLE READ 
begin transaction
select * from product where id_product = 1;
waitfor delay '00:00:03'
select * from product where id_product = 1;
commit
--------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ 
begin transaction
select * from product where id_product = 2;
waitfor delay '00:00:04'
select * from product where id_product = 2;
commit
--------------------
---- ��������� ������ ----
set transaction isolation level REPEATABLE READ 
begin transaction
select * from product where id_product = 4
waitfor delay '00:00:03'
select * from product where id_product = 4
commit
--------------------

---- 7 ������� ----

---- ���������� � ------

---- -���������������� ������ ----
set transaction isolation level SERIALIZABLE 
begin transaction
select * from product where id_product = 1;
waitfor delay '00:00:03'
select * from product where id_product = 1;
commit
--------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
begin transaction
select * from product where id_product = 2;
waitfor delay '00:00:04'
select * from product where id_product = 2;
commit
--------------------
---- ��������� ������ ----
set transaction isolation level SERIALIZABLE 
begin transaction
select * from product where id_product = 4
waitfor delay '00:00:03'
select * from product where id_product = 4
commit
--------------------

---- 8 ������� ----

---- �������� COMMIT ��������� ���������� ��������� ������ 
---- �� ���������� �������� ��������� ����������; 

set transaction isolation level REPEATABLE READ 
begin transaction
insert product
	values(4, 'FANTOM', 696969);
select * from product where id_product = 4;

	begin transaction
	update product set price = 0 where id_product = 4;
	commit

	select * from product where id_product = 4;
commit

delete from product where id_product = 4;

--- ������� �������� ���������� ����������� �� ������������ ����������
 
--- �������� ROLLBACK ������� ���������� �������� ��������������� 
--- �������� ���������� ����������; 

set transaction isolation level REPEATABLE READ 
begin transaction
insert product
	values(4, 'FANTOM', 696969);
select * from product where id_product = 4;

	begin transaction
	update product set price = 0 where id_product = 4;
	insert product
		values(5, 'FANTOM', 696969);
	commit;
	select * from product where id_product = 4;
	select * from product where id_product = 5;
rollback;
select * from product where id_product = 4;
select * from product where id_product = 5;

--- �������� ROLLBACK ��������� ���������� 
--- ��������� �� �������� ������� � ���������� ����������, � 
--- ����� ��������� ��� ����������; 

set transaction isolation level REPEATABLE READ 
begin transaction
insert product
	values(4, 'FANTOM', 696969);
select * from product where id_product = 4;

	begin transaction
	update product set price = 0 where id_product = 4;
	insert product
		values(5, 'FANTOM', 696969);
	select * from product where id_product = 5;
	rollback;
	select * from product where id_product = 4;
	select * from product where id_product = 5;
commit;

select * from product where id_product = 4;
select * from product where id_product = 5;

--- ������� ����������� ���������� ����� ���������� � ������� 
--- ��������� ������� @@TRANCOUT. 

begin tran

begin tran
	select @@TRANCOUNT
commit tran;

commit tran;
