----- 1 ЗАДАНИЕ -----

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME[КАФЕДРЫ], PROFESSION.PROFESSION_NAME
	from FACULTY, PULPIT, PROFESSION
		where FACULTY.FACULTY = PULPIT.FACULTY AND PROFESSION.FACULTY = PULPIT.FACULTY 
			AND PROFESSION.PROFESSION in (select PROFESSION.PROFESSION
									from PROFESSION where( PROFESSION.PROFESSION_NAME like '%технология%' or 
															PROFESSION.PROFESSION_NAME like '%технологии%'))
	order by PULPIT.PULPIT_NAME
	
----- 2 ЗАДАНИЕ -----

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME[КАФЕДРЫ], PROFESSION.PROFESSION_NAME
	from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY, PROFESSION
		where PROFESSION.FACULTY = PULPIT.FACULTY and PROFESSION.PROFESSION in (select PROFESSION.PROFESSION
									from PROFESSION where( PROFESSION.PROFESSION_NAME like '%технология%' or 
															PROFESSION.PROFESSION_NAME like '%технологии%'))
	order by PULPIT.PULPIT_NAME

----- 3 ЗАДАНИЕ -----

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME[КАФЕДРЫ], PROFESSION.PROFESSION_NAME
	from FACULTY inner join PROFESSION
		on FACULTY.FACULTY = PROFESSION.FACULTY 
		inner join PULPIT
		on PROFESSION.FACULTY = PULPIT.FACULTY
		where PROFESSION.PROFESSION_NAME like '%технология%' or 
															PROFESSION.PROFESSION_NAME like '%технологии%'
	order by PULPIT.PULPIT_NAME

----- 4 ЗАДАНИЕ -----

select *
	from AUDITORIUM a
	where a.AUDITORIUM = (select top(1) aa.AUDITORIUM from AUDITORIUM aa
		where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc)

----- 5 ЗАДАНИЕ -----

select FACULTY.FACULTY_NAME
	from FACULTY
		where not exists (select * from PULPIT
							where PULPIT.FACULTY = FACULTY.FACULTY)

----- 6 ЗАДАНИЕ -----

select top 1
	(select avg(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT like 'ОАиП')[ОАиП],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT like 'БД')[БД],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT like 'СУБД')[СУБД]
	from PROGRESS

----- 7 ЗАДАНИЕ -----

select PROGRESS.SUBJECT[Дисциплина], PROGRESS.NOTE[Оценка], STUDENT.NAME[Студент]
	from PROGRESS
	 inner join STUDENT
		on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where PROGRESS.NOTE >= ALL(select PROGRESS.NOTE from PROGRESS
									where PROGRESS.SUBJECT like 'СУБД') and PROGRESS.SUBJECT like 'СУБД'

----- 8 ЗАДАНИЕ -----

select PROGRESS.SUBJECT[Дисциплина], PROGRESS.NOTE[Оценка], STUDENT.NAME[Студент]
	from PROGRESS
	 inner join STUDENT
		on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT and PROGRESS.SUBJECT like 'ОАиП'
			where PROGRESS.NOTE < ANY(select PROGRESS.NOTE from PROGRESS
									where PROGRESS.SUBJECT like 'ОАиП')
