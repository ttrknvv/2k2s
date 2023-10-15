------------ 1-1 задание ------------
use UNIVER

select f.FACULTY, g.PROFESSION, p.SUBJECT, avg(p.NOTE)[Средняя оценка]
	from FACULTY as f
		inner join GROUPS as g
	on f.FACULTY = g.FACULTY
		inner join STUDENT as s
	on s.IDGROUP = g.IDGROUP
		inner join PROGRESS as p
	on p.IDSTUDENT = s.IDSTUDENT
		where f.FACULTY like 'ИДиП'
		group by f.FACULTY, g.PROFESSION, p.SUBJECT

------------ 1-2 задание ------------

select f.FACULTY, g.PROFESSION, p.SUBJECT, avg(p.NOTE)[Средняя оценка]
	from FACULTY as f
		inner join GROUPS as g
	on f.FACULTY = g.FACULTY
		inner join STUDENT as s
	on s.IDGROUP = g.IDGROUP
		inner join PROGRESS as p
	on p.IDSTUDENT = s.IDSTUDENT
		where f.FACULTY like 'ИДиП'
		group by rollup (f.FACULTY, g.PROFESSION, p.SUBJECT)

------------ 2 задание ------------

select f.FACULTY, g.PROFESSION, p.SUBJECT, avg(p.NOTE)[Средняя оценка]
	from FACULTY as f
		inner join GROUPS as g
	on f.FACULTY = g.FACULTY
		inner join STUDENT as s
	on s.IDGROUP = g.IDGROUP
		inner join PROGRESS as p
	on p.IDSTUDENT = s.IDSTUDENT
		where f.FACULTY like 'ИДиП'
		group by cube (f.FACULTY, g.PROFESSION, p.SUBJECT)

------------ 3-1 задание ------------

select GROUPS.PROFESSION, PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ТОВ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
	union 
	select GROUPS.PROFESSION, PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ХТиТ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT

------------ 3-2 задание ------------

select GROUPS.PROFESSION, PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ТОВ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
	union all
	select GROUPS.PROFESSION, PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ХТиТ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT

------------ 4 задание ------------

select PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ТОВ'
	group by PROGRESS.SUBJECT
	intersect
	select PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ХТиТ'
	group by PROGRESS.SUBJECT

------------ 5 задание ------------

select PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ХТиТ'
	group by PROGRESS.SUBJECT
	except
	select PROGRESS.SUBJECT, avg(PROGRESS.NOTE)[Средняя оценка]
	from GROUPS inner join STUDENT
			on STUDENT.IDGROUP = GROUPS.IDGROUP
		inner join PROGRESS
			on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where GROUPS.FACULTY LIKE 'ТОВ'
	group by PROGRESS.SUBJECT