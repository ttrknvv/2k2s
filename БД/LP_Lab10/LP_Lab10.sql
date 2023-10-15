------------- 1-1 ������� -------------

use UNIVER;

exec sp_helpindex 'AUDITORIUM';
exec sp_helpindex 'AUDITORIUM_TYPE';
exec sp_helpindex 'FACULTY';
exec sp_helpindex 'GROUPS';
exec sp_helpindex 'PROFESSION';
exec sp_helpindex 'PROGRESS';
exec sp_helpindex 'PULPIT';
exec sp_helpindex 'STUDENT';
exec sp_helpindex 'SUBJECT';
exec sp_helpindex 'TEACHER';
exec sp_helpindex 'TIMETABLE';

------------- 1-2 ������� -------------

create table #temp
(
	name varchar(30),
	age int not null
)
declare @i int = 0;
set nocount on;           
while @i < 1100
begin
	insert #temp(name, age)
		values(concat('Nikita', cast(@i as varchar(1000))), 100 * rand());
	set @i = @i + 1;
end

------------- 1-3 ������� -------------

select *
	from #temp
		where #temp.age between 20 and 30
			order by #temp.age

------------- 1-4 ������� -------------

checkpoint;
DBCC DROPCLEANBUFFERS;

create clustered index #temp_ind on #temp(age asc)
drop table #temp;

------------- 2-1 ������� -------------

create table #tovar
(
	name varchar(30),
	price int not null
)
declare @i int = 0;
set nocount on;  
while @i < 11000
begin
	insert #tovar(name, price)
		values(concat('IPhone', cast(@i as varchar(1000))), 1000 * rand());
	set @i = @i + 1;
end

------------- 2-2 ������� -------------

select * 
	from #tovar
		where #tovar.price between 500 and 1000
			order by #tovar.price

------------- 2-3 ������� -------------

create index #ind_tovar on #tovar(name, price)
select * 
	from #tovar
		where #tovar.price = 550
			order by #tovar.name

------------- 3-1 ������� -------------

create table #cars
(
	name varchar(30),
	price int not null
)
declare @i int = 0;
set nocount on;           
while @i < 11000
begin
	insert #cars(name, price)
		values(concat('Tesla', cast(@i as varchar(1000))), 10000 * rand());
	set @i = @i + 1;
end

------------- 3-2 ������� -------------

select *
	from #cars
		where #cars.price between 100 and 600
			order by #cars.name

------------- 3-3 ������� -------------

create index #ex_cars on #cars(price) include(name)
drop index #ex_cars on #cars

------------- 4-1 ������� -------------

create table #tempp
(
	name varchar(15),
	age int,
	money real
)
declare @i int = 0;
while @i < 1000
begin
	insert #tempp(name, age, money)
		values('Nik', 10 * rand(), 10000 * rand());
	set @i = @i + 1;
end

------------- 4-2 ������� -------------

select #tempp.money
	from #tempp
		where #tempp.money > 2000 and #tempp.money < 5000

------------- 4-3 ������� -------------

create index #tempp_where on #tempp(money) where (money >= 2000 and money < 6000)
drop index #tempp_where on #tempp

------------- 5-1 ������� -------------

create table #tempm
(
	name varchar(30),
	size real
)
declare @i int = 0;
while @i < 10000
begin
	insert #tempm(name, size)
		values(concat('Cow', cast((10000 * rand()) as varchar(10))), 100 * rand());
	set @i = @i + 1;
end

------------- 5-2 ������� -------------

create index #ind_size on #tempm(size)
create index #ind_size2 on #tempm(name)
drop index #ind_size on #tempm
drop index #ind_size2 on #tempm
drop table #tempm 
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'tempdb'), 
OBJECT_ID(N'#tempm'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;
select #tempm.name from #tempm where name like '%2'

INSERT top(40000) #tempm(name, size) select name, size from #tempm;

------------- 5-3 ������� -------------

alter index #ind_size on #tempm reorganize;

------------- 5-4 ������� -------------

alter index #ind_size2 on #tempm rebuild with(online = off);

------------- 6 ������� -------------

drop index #ind_size on #tempm;
create index #ind_size on #tempm(size) with (fillfactor = 65)
insert top(50)percent  
	into #tempm(name, size)
		select name, size from #tempm			