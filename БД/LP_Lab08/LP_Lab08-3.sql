----------- 8 ������� -----------

use UNIVER;

create view [������� ���������]
	as select top 50 t.DAYWEEK[����], t.PAIR[����], t.AUDITORIUM[���������]
		from TIMETABLE as t
			order by t.PAIR

select * from [������� ���������]

drop view [������� ���������]


	------- ������� ��������� ������ �� ������������ ����
	
select DAYWEEK, [1], [2], [3], [4]
	from (select DAYWEEK, PAIR, AUDITORIUM from TIMETABLE) as a
	PIVOT 
	(
		count(AUDITORIUM) for PAIR in ([1], [2], [3], [4])
	) as p

		------ ������� ��������� ������ � ������������ ����

select PAIR, [2023-03-12], [2023-03-13], [2023-03-14], [2023-03-15], [2023-03-16]
	from (select PAIR, DAYWEEK, AUDITORIUM from TIMETABLE) as a
	PIVOT 
	(
		count(AUDITORIUM) for DAYWEEK in ([2023-03-12], [2023-03-13], [2023-03-14], [2023-03-15], [2023-03-16])
	) as p


use T_MyBase;

select avgg as ' ', [������������� �����], [������� �����], [���������������], 
		[Apple iPhone 14 PRO], [������������ �����], [�������������], [Apple Watch Ultra LTE 49]
	from (select '���������� ������' as 'avgg', [�������� ������], [���������� ����������� ������]
			from ������ inner join ������ on ������.[ID ������] = ������.[ID ������]) as t
	PIVOT
	(
		sum([���������� ����������� ������]) for [�������� ������] in ([������������� �����], [������� �����], 
		[���������������], [Apple iPhone 14 PRO], [������������ �����], [�������������], [Apple Watch Ultra LTE 49])
	) as p


		