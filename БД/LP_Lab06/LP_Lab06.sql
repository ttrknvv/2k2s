---------------- GROUP BY -------------------

use UNIVER

-------- 1 задание -------

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
		max(AUDITORIUM.AUDITORIUM_CAPACITY)[Максимальная вместимость],
		min(AUDITORIUM.AUDITORIUM_CAPACITY)[Минимальная вместимость],
		avg(AUDITORIUM.AUDITORIUM_CAPACITY)[Средняя вместимость],
		sum(AUDITORIUM.AUDITORIUM_CAPACITY)[Суммарная вместимость],
		count(*) [Общее количество аудиторий]
	from AUDITORIUM inner join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	group by AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

-------- 2 задание -------

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
		max(AUDITORIUM.AUDITORIUM_CAPACITY) as 'Максимальная вместимость',
		min(AUDITORIUM.AUDITORIUM_CAPACITY) as 'Минимальная вместимость',
		avg(AUDITORIUM.AUDITORIUM_CAPACITY) as 'Средняя вместимость',
		sum(AUDITORIUM.AUDITORIUM_CAPACITY) as 'Суммарная вместимость',
		count(*) as 'Общее количество аудиторий'
	from AUDITORIUM inner join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	group by AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

-------- 3 задание -------

select *
	from (select Case
			when PROGRESS.NOTE between 0 and 3 then 'неудовлетворительно'
			when PROGRESS.NOTE between 4 and 6 then 'удовлетворительно'
			when PROGRESS.NOTE between 7 and 8 then 'хорошо'
			when PROGRESS.NOTE between 9 and 10 then 'отлично'
			end [Интервалы оценок], count(*)[Количество]
				from PROGRESS group by case
			when PROGRESS.NOTE between 0 and 3 then 'неудовлетворительно'
			when PROGRESS.NOTE between 4 and 6 then 'удовлетворительно'
			when PROGRESS.NOTE between 7 and 8 then 'хорошо'
			when PROGRESS.NOTE between 9 and 10 then 'отлично' end) as P
				order by case [Интервалы оценок]
					when 'неуд' then 4
					when 'удовлетвр' then 3
					when 'хорошо' then 2
					when 'отлично' then 1
					else 0
					end

-------- 4 задание -------

select f.FACULTY, g.PROFESSION, (2014 - g.YEAR_FIRST) [Курс], round(avg(cast(p.NOTE as float(4))), 2)[Средняя оценка]
	from FACULTY as f
		inner join GROUPS as g
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on g.IDGROUP = s.IDGROUP
		inner join PROGRESS as p
			on s.IDSTUDENT = p.IDSTUDENT
		group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST
		order by [Средняя оценка] desc
	
-------- 5 задание -------

select f.FACULTY, g.PROFESSION, (2014 - g.YEAR_FIRST) [Курс], round(avg(cast(p.NOTE as float(4))), 2)[Средняя оценка]
	from FACULTY as f
		inner join GROUPS as g
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on g.IDGROUP = s.IDGROUP
		inner join PROGRESS as p
			on s.IDSTUDENT = p.IDSTUDENT
		where p.SUBJECT like 'СУБД' or p.SUBJECT like 'ОАиП'
		group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST
		order by [Средняя оценка] desc

-------- 6 задание -------

select f.FACULTY, g.PROFESSION, (2014 - g.YEAR_FIRST) [Курс], round(avg(cast(p.NOTE as float(4))), 2)[Средняя оценка]
	from FACULTY as f
		inner join GROUPS as g
			on f.FACULTY = g.FACULTY
		inner join STUDENT as s
			on g.IDGROUP = s.IDGROUP
		inner join PROGRESS as p
			on s.IDSTUDENT = p.IDSTUDENT
		where f.FACULTY like 'ИДиП'
		group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST

-------- 7 задание -------

select p.SUBJECT, p.NOTE, (select count(*) from PROGRESS pp where (pp.NOTE = 8 or pp.NOTE = 9)
					and pp.SUBJECT = p.SUBJECT)[Количество студентов]
	 from PROGRESS as p
		group by p.SUBJECT, p.NOTE
		having p.NOTE = 8 or p.NOTE = 9