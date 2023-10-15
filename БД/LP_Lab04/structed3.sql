use UNIVER;

----- ��������� ��������� 1-�� ����

select * 
	from AUDITORIUM
		where AUDITORIUM.AUDITORIUM not in 
		(select TIMETABLE.AUDITORIUM 
			from TIMETABLE where TIMETABLE.PAIR = 1)

----- ��������� ��������� � ���

select *
	from AUDITORIUM
		where AUDITORIUM.AUDITORIUM not in
		(select TIMETABLE.AUDITORIUM
			from TIMETABLE where TIMETABLE.DAYWEEK = '2023-03-12')

------ �������� � ����� 1-�� �����

select *
	from GROUPS
		where GROUPS.IDGROUP not in
		(select TIMETABLE.IDGROUP
			from TIMETABLE where TIMETABLE.PAIR = 1)

------- �������� � �������������� 1-�� �����

select *
	from TEACHER
		where TEACHER.TEACHER not in
		(select TIMETABLE.TEACHER
			from TIMETABLE where TIMETABLE.PAIR = 1)
		
------ inner join - ����������� - �������������

use UNIVER;

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM inner join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE != AUDITORIUM_TYPE.AUDITORIUM_TYPE 

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM_TYPE inner join AUDITORIUM
		on AUDITORIUM.AUDITORIUM_TYPE != AUDITORIUM_TYPE.AUDITORIUM_TYPE

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from SUBJECT inner join PULPIT
		on SUBJECT.PULPIT = PULPIT.PULPIT

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from PULPIT inner join SUBJECT
		on SUBJECT.PULPIT = PULPIT.PULPIT

------ full outer join - �� ����� ������� + ����������� �������� ������ - �������������

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM full outer join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM_TYPE full outer join AUDITORIUM
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from SUBJECT full outer join PULPIT
		on SUBJECT.PULPIT = PULPIT.PULPIT

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from PULPIT full outer join SUBJECT
		on SUBJECT.PULPIT = PULPIT.PULPIT

------ left outer join - �� ����� ������� - ���������������

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM left outer join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM_TYPE left outer join AUDITORIUM
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from SUBJECT left outer join PULPIT
		on SUBJECT.PULPIT = PULPIT.PULPIT

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from PULPIT left outer join SUBJECT
		on SUBJECT.PULPIT = PULPIT.PULPIT

------ right outer join - �� ������ ������� ������� - ���������������

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM right outer join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM_TYPE right outer join AUDITORIUM
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from SUBJECT right outer join PULPIT
		on SUBJECT.PULPIT = PULPIT.PULPIT

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from PULPIT right outer join SUBJECT
		on SUBJECT.PULPIT = PULPIT.PULPIT

------ cross join - ��������� ������������ �� primary ����� - ������������� - ������_�����_������� = ������_1_������� * ������_2_�������

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM cross join AUDITORIUM_TYPE
		where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM_TYPE[AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM_TYPE cross join AUDITORIUM
		where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from SUBJECT cross join PULPIT
		where SUBJECT.PULPIT = PULPIT.PULPIT

select SUBJECT.PULPIT[SUBJECT], PULPIT.PULPIT, PULPIT.PULPIT_NAME, SUBJECT.SUBJECT_NAME
	from PULPIT cross join SUBJECT
		where SUBJECT.PULPIT = PULPIT.PULPIT