--------- 7-1* ---------

use UNIVER

select isnull(cast(g.IDGROUP as varchar), '�� �����������')[������], isnull(f.FACULTY, '�� �����������')[���������], 
				count(s.IDSTUDENT)[���������� ���������]
	from GROUPS as g
		inner join FACULTY as f
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on s.IDGROUP = g.IDGROUP
		group by rollup(f.FACULTY, g.IDGROUP)

--------- 7-2* ---------

select isnull(at.AUDITORIUM_TYPENAME,'�� �����������')[��� ���������], count(a.AUDITORIUM)[���������� ���������], 
				sum(a.AUDITORIUM_CAPACITY)[��������� �����������]
	from AUDITORIUM_TYPE as at
		inner join AUDITORIUM as a
	on at.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE
	group by rollup(at.AUDITORIUM_TYPENAME)
	order by [��������� �����������]