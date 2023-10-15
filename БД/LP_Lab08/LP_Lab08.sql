---------- 1 ������� ----------

use UNIVER;

create view [�������������]
	as select t.TEACHER[��� �������������], t.GENDER[���], p.PULPIT[�������] 
		from TEACHER as t 
		inner join PULPIT as p
			on t.PULPIT = p.PULPIT
go

select * from [�������������]

drop view [�������������];
go

---------- 2 ������� ----------

create view [���������� ������]
	as select f.FACULTY_NAME[���������], count(p.PULPIT)[���������� ������] 
		from FACULTY as f
		inner join PULPIT as p
			on f.FACULTY = p.FACULTY
		group by f.FACULTY_NAME
go
select * from [���������� ������]

drop view [���������� ������];
go
---------- 3 ������� ----------

create view [���������](���, [������������ ���������])
	as select a.AUDITORIUM[���], a.AUDITORIUM_TYPE[������������ ���������]
		from AUDITORIUM as a
			where a.AUDITORIUM_TYPE like '��%'

select * from [���������]

insert [���������] values('123', '��')
update [���������] set ��� = '321' where ��� like '123'
delete [���������] where ��� like '321'

drop view [���������]
go

---------- 4 ������� ----------

create view [���������� ���������]
 as select a.AUDITORIUM[���], a.AUDITORIUM_TYPE[������������ ���������]
		from AUDITORIUM as a
			where a.AUDITORIUM_TYPE like '��%'

select * from [���������� ���������]

drop view [���������� ���������]

---------- 5 ������� ----------

create view [����������]
	as select top 100 s.SUBJECT[���], s.SUBJECT_NAME[������������ ����������], s.PULPIT[�������]
		from SUBJECT as s
			order by s.SUBJECT_NAME

select * from [����������]

drop view [����������]

---------- 6 ������� ----------

alter view [���������� ������] with schemabinding
	as select f.FACULTY_NAME[���������], count(p.PULPIT)[���������� ������] 
		from dbo.FACULTY f inner join dbo.PULPIT p
			on f.FACULTY = p.FACULTY
		group by f.FACULTY_NAME

select * from [���������� ������]

drop view [���������� ������]