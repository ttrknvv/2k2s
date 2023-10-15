--------- 7-1* ---------

use UNIVER

select isnull(cast(g.IDGROUP as varchar), 'Не учитывается')[Группа], isnull(f.FACULTY, 'Не учитывается')[Факультет], 
				count(s.IDSTUDENT)[Количество студентов]
	from GROUPS as g
		inner join FACULTY as f
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on s.IDGROUP = g.IDGROUP
		group by rollup(f.FACULTY, g.IDGROUP)

--------- 7-2* ---------

select isnull(at.AUDITORIUM_TYPENAME,'Не учитывается')[Тип аудитории], count(a.AUDITORIUM)[Количество аудиторий], 
				sum(a.AUDITORIUM_CAPACITY)[Суммарная вместимость]
	from AUDITORIUM_TYPE as at
		inner join AUDITORIUM as a
	on at.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE
	group by rollup(at.AUDITORIUM_TYPENAME)
	order by [Суммарная вместимость]