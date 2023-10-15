---------------- GROUP BY -------------------

use UNIVER

-------- 1 ������� -------

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
		max(AUDITORIUM.AUDITORIUM_CAPACITY)[������������ �����������],
		min(AUDITORIUM.AUDITORIUM_CAPACITY)[����������� �����������],
		avg(AUDITORIUM.AUDITORIUM_CAPACITY)[������� �����������],
		sum(AUDITORIUM.AUDITORIUM_CAPACITY)[��������� �����������],
		count(*) [����� ���������� ���������]
	from AUDITORIUM inner join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	group by AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

-------- 2 ������� -------

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
		max(AUDITORIUM.AUDITORIUM_CAPACITY) as '������������ �����������',
		min(AUDITORIUM.AUDITORIUM_CAPACITY) as '����������� �����������',
		avg(AUDITORIUM.AUDITORIUM_CAPACITY) as '������� �����������',
		sum(AUDITORIUM.AUDITORIUM_CAPACITY) as '��������� �����������',
		count(*) as '����� ���������� ���������'
	from AUDITORIUM inner join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	group by AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

-------- 3 ������� -------

select *
	from (select Case
			when PROGRESS.NOTE between 0 and 3 then '�������������������'
			when PROGRESS.NOTE between 4 and 6 then '�����������������'
			when PROGRESS.NOTE between 7 and 8 then '������'
			when PROGRESS.NOTE between 9 and 10 then '�������'
			end [��������� ������], count(*)[����������]
				from PROGRESS group by case
			when PROGRESS.NOTE between 0 and 3 then '�������������������'
			when PROGRESS.NOTE between 4 and 6 then '�����������������'
			when PROGRESS.NOTE between 7 and 8 then '������'
			when PROGRESS.NOTE between 9 and 10 then '�������' end) as P
				order by case [��������� ������]
					when '����' then 4
					when '���������' then 3
					when '������' then 2
					when '�������' then 1
					else 0
					end

-------- 4 ������� -------

select f.FACULTY, g.PROFESSION, (2014 - g.YEAR_FIRST) [����], round(avg(cast(p.NOTE as float(4))), 2)[������� ������]
	from FACULTY as f
		inner join GROUPS as g
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on g.IDGROUP = s.IDGROUP
		inner join PROGRESS as p
			on s.IDSTUDENT = p.IDSTUDENT
		group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST
		order by [������� ������] desc
	
-------- 5 ������� -------

select f.FACULTY, g.PROFESSION, (2014 - g.YEAR_FIRST) [����], round(avg(cast(p.NOTE as float(4))), 2)[������� ������]
	from FACULTY as f
		inner join GROUPS as g
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on g.IDGROUP = s.IDGROUP
		inner join PROGRESS as p
			on s.IDSTUDENT = p.IDSTUDENT
		where p.SUBJECT like '����' or p.SUBJECT like '����'
		group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST
		order by [������� ������] desc

-------- 6 ������� -------

select f.FACULTY, g.PROFESSION, (2014 - g.YEAR_FIRST) [����], round(avg(cast(p.NOTE as float(4))), 2)[������� ������]
	from FACULTY as f
		inner join GROUPS as g
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on g.IDGROUP = s.IDGROUP
		inner join PROGRESS as p
			on s.IDSTUDENT = p.IDSTUDENT
		where f.FACULTY like '����'
		group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST

-------- 7 ������� -------

select p.SUBJECT, p.NOTE, (select count(*) from PROGRESS pp where (pp.NOTE = 8 or pp.NOTE = 9)
					and pp.SUBJECT = p.SUBJECT)[���������� ���������]
	 from PROGRESS as p
		group by p.SUBJECT, p.NOTE
		having p.NOTE = 8 or p.NOTE = 9