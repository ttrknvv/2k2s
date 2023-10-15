-------- ���������������� ������ ---------\

use T_MyBase;
exec sp_helpindex '������'

checkpoint;  --�������� ��
DBCC DROPCLEANBUFFERS;
create clustered index #ind_zak on ������([������� ���������] asc)
drop index #ind_zak on ������;
select *
	from ������ z
		where z.[������� ���������] like '%25%'


--------- ������������������ ������ ----------

select * 
	from ������ t
		where t.[�������� ������] like '%�%'

create index #ind_tov on ������([�������� ������])
drop index #ind_tov on ������

------ ������ �� ���������� �������� ------

create index #ind_zakazch on ������([ID ������], [���������� ����������� ������])
drop index #ind_zakazch on ������

select *
	from ������ z
		where z.[���������� ����������� ������] between 1 and 5 and z.[ID ������] between 1 and 6 

------ ������������������ ������ ��������  --------

create index #ind_zakk on ������([���������� ����������� ������]) include([ID ������])
drop index #ind_zakk on ������
select *
	from ������ z
		where z.[���������� ����������� ������] between 1 and 5 and z.[ID ������] between 1 and 6 

------- ������������������ ����������� ������ ------

create index #ind_zakk2 on ������([ID ������]) where([ID ������] < 5)
drop index #ind_zakk2 on ������
select *
	from ������ z
		where z.[ID ������] between 1 and 3

------ ������������ -----
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'T_MyBase'), 
OBJECT_ID(N'������'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
	on ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;

alter index #ind_zakk2 on ������ reorganize
alter index #ind_zakk2 on ������ rebuild with(online = off)

create index #ind_zakk2 on ������([ID ������]) with (fillfactor =  65)


