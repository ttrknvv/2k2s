----- 1 ������� -----

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME[�������], PROFESSION.PROFESSION_NAME
	from FACULTY, PULPIT, PROFESSION
		where FACULTY.FACULTY = PULPIT.FACULTY AND PROFESSION.FACULTY = PULPIT.FACULTY 
			AND PROFESSION.PROFESSION in (select PROFESSION.PROFESSION
									from PROFESSION where( PROFESSION.PROFESSION_NAME like '%����������%' or 
															PROFESSION.PROFESSION_NAME like '%����������%'))
	order by PULPIT.PULPIT_NAME
	
----- 2 ������� -----

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME[�������], PROFESSION.PROFESSION_NAME
	from FACULTY inner join PULPIT
		on FACULTY.FACULTY = PULPIT.FACULTY, PROFESSION
		where PROFESSION.FACULTY = PULPIT.FACULTY and PROFESSION.PROFESSION in (select PROFESSION.PROFESSION
									from PROFESSION where( PROFESSION.PROFESSION_NAME like '%����������%' or 
															PROFESSION.PROFESSION_NAME like '%����������%'))
	order by PULPIT.PULPIT_NAME

----- 3 ������� -----

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME[�������], PROFESSION.PROFESSION_NAME
	from FACULTY inner join PROFESSION
		on FACULTY.FACULTY = PROFESSION.FACULTY 
		inner join PULPIT
		on PROFESSION.FACULTY = PULPIT.FACULTY
		where PROFESSION.PROFESSION_NAME like '%����������%' or 
															PROFESSION.PROFESSION_NAME like '%����������%'
	order by PULPIT.PULPIT_NAME

----- 4 ������� -----

select *
	from AUDITORIUM a
	where a.AUDITORIUM = (select top(1) aa.AUDITORIUM from AUDITORIUM aa
		where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc)

----- 5 ������� -----

select FACULTY.FACULTY_NAME
	from FACULTY
		where not exists (select * from PULPIT
							where PULPIT.FACULTY = FACULTY.FACULTY)

----- 6 ������� -----

select top 1
	(select avg(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT like '����')[����],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT like '��')[��],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT like '����')[����]
	from PROGRESS

----- 7 ������� -----

select PROGRESS.SUBJECT[����������], PROGRESS.NOTE[������], STUDENT.NAME[�������]
	from PROGRESS
	 inner join STUDENT
		on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where PROGRESS.NOTE >= ALL(select PROGRESS.NOTE from PROGRESS
									where PROGRESS.SUBJECT like '����') and PROGRESS.SUBJECT like '����'

----- 8 ������� -----

select PROGRESS.SUBJECT[����������], PROGRESS.NOTE[������], STUDENT.NAME[�������]
	from PROGRESS
	 inner join STUDENT
		on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT and PROGRESS.SUBJECT like '����'
			where PROGRESS.NOTE < ANY(select PROGRESS.NOTE from PROGRESS
									where PROGRESS.SUBJECT like '����')
