-------- кластаризованный индекс ---------\

use T_MyBase;
exec sp_helpindex 'Товары'

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;
create clustered index #ind_zak on ЗАКАЗЫ([Телефон заказчика] asc)
drop index #ind_zak on ЗАКАЗЫ;
select *
	from ЗАКАЗЫ z
		where z.[Телефон заказчика] like '%25%'


--------- некластаризованный индекс ----------

select * 
	from ТОВАРЫ t
		where t.[Название товара] like '%н%'

create index #ind_tov on ТОВАРЫ([Название товара])
drop index #ind_tov on Товары

------ индекс по нескольким столбцам ------

create index #ind_zakazch on ЗАКАЗЫ([ID товара], [Количество заказанного товара])
drop index #ind_zakazch on ЗАКАЗЫ

select *
	from ЗАКАЗЫ z
		where z.[Количество заказанного товара] between 1 and 5 and z.[ID товара] between 1 and 6 

------ Некластеризованный индекс покрытия  --------

create index #ind_zakk on ЗАКАЗЫ([Количество заказанного товара]) include([ID товара])
drop index #ind_zakk on ЗАКАЗЫ
select *
	from ЗАКАЗЫ z
		where z.[Количество заказанного товара] between 1 and 5 and z.[ID товара] between 1 and 6 

------- некластеризованный фильтруемый индекс ------

create index #ind_zakk2 on ЗАКАЗЫ([ID товара]) where([ID товара] < 5)
drop index #ind_zakk2 on ЗАКАЗЫ
select *
	from ЗАКАЗЫ z
		where z.[ID товара] between 1 and 3

------ фрагментация -----
SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'T_MyBase'), 
OBJECT_ID(N'ЗАКАЗЫ'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
	on ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;

alter index #ind_zakk2 on ЗАКАЗЫ reorganize
alter index #ind_zakk2 on ЗАКАЗЫ rebuild with(online = off)

create index #ind_zakk2 on ЗАКАЗЫ([ID товара]) with (fillfactor =  65)


