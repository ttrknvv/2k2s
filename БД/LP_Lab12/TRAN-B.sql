---- 4 ������� ----

---- ���������� B ------

---- ���������������� ������ -----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
update product set price = 0 where id_product = 1;
waitfor delay '00:00:03'
rollback
--------------------------------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin transaction
waitfor delay '00:00:02'
update product set price = 9999 where id_product = 2;
waitfor delay '00:00:04'
rollback
--------------------

---- ��������� ������ ----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
insert product
	values(4, 'FANTOM', 696969);
	waitfor delay '00:00:03'
rollback
--------------------

---- 5 ������� ----

---- ���������� B ------

---- -���������������� ������ -----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
update product set price = 0 where id_product = 1;
waitfor delay '00:00:03'
commit
update product set price = 5334 where id_product = 1;
--------------------------------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin transaction
waitfor delay '00:00:02'
update product set price = 9999 where id_product = 2;
commit
update product set price = 3432 where id_product = 2;
--------------------

---- ��������� ������ ----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
insert product
	values(4, 'FANTOM', 696969);
commit
delete product where id_product = 4;
--------------------

---- 6 ������� ----

---- ���������� B ------

---- -���������������� ������ -----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
update product set price = 0 where id_product = 1;
waitfor delay '00:00:03'
commit
update product set price = 5334 where id_product = 1;
--------------------------------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin transaction
waitfor delay '00:00:02'
update product set price = 9999 where id_product = 2;
commit
update product set price = 3432 where id_product = 2;
--------------------

---- ��������� ������ ----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
insert product
	values(4, 'FANTOM', 696969);
commit
delete product where id_product = 4;
--------------------

---- 7 ������� ----

---- ���������� B ------

---- -���������������� ������ -----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
update product set price = 0 where id_product = 1;
waitfor delay '00:00:03'
commit
update product set price = 5334 where id_product = 1;
--------------------------------------------

---- ��������������� ������ ----
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin transaction
waitfor delay '00:00:02'
update product set price = 9999 where id_product = 2;
commit
update product set price = 3432 where id_product = 2;
--------------------

---- ��������� ������ ----
set transaction isolation level READ COMMITTED 
begin transaction
waitfor delay '00:00:03'
insert product
	values(4, 'FANTOM', 696969);
commit
delete product where id_product = 4;
--------------------
