----- 1 ������� -----

	select ������.[������� ���������], ������.[�������� ������], ���������.���, ���������.�������
		from ������, ������, ���������
			where ������.[ID ������] = ������.[ID ������] and ���������.������� = ������.[������� ���������]
				and ������.[ID ������] in (select ������.[ID ������] from ������ 
													where ������.[�������� ������] like '%�����%')
				order by ������.[�������� ������] 
	
----- 2 ������� -----

	select ������.[������� ���������], ������.[�������� ������], ���������.���, ���������.�������
		from ������ inner join ������
			on ������.[ID ������] = ������.[ID ������], ���������
			where ���������.������� = ������.[������� ���������]
				and ������.[ID ������] in (select ������.[ID ������] from ������ 
													where ������.[�������� ������] like '%�����%')
		order by ������.[�������� ������] 

----- 3 ������� -----

	select ������.[������� ���������], ������.[�������� ������], ���������.���, ���������.�������
		from ������ inner join ������
			on ������.[ID ������] = ������.[ID ������]
		inner join ���������
			on ���������.������� = ������.[������� ���������]
			where ������.[�������� ������] like '%�����%'
		order by ������.[�������� ������] 

----- 4 ������� -----

select *
	from AUDITORIUM a
	where a.AUDITORIUM = (select top(1) aa.AUDITORIUM from AUDITORIUM aa
		where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc)

select  *
	from ������ a
		where a.[������� ���������] = (select top(1) aa.[������� ���������] from ������ aa
			where a.[ID ������] = aa.[ID ������] order by [���������� ����������� ������] desc)

----- 5 ������� -----

select ������.[ID ������], ������.[�������� ������]
	from ������
		where not exists (select * from ������	
							where ������.[ID ������] = ������.[ID ������])

----- 6 ������� -----

select top 1
	(select avg(������.����) from ������	
		where ������.[�������� ������] like '%�����%')[�����],
	(select avg(������.����) from ������	
		where ������.[�������� ������] like '%�����%')[�����]
		from ������

----- 7 ������� -----

select ������.[ID ������], ������.[�������� ������],������.����, ������.[���������� ����������� ������]
	from ������
		inner join ������
			on ������.[ID ������] = ������.[ID ������]
				where ������.���� >= 
				ALL(select ������.���� from ������
						where ������.[�������� ������] like '%�����%') and ������.[�������� ������] like '%�����%'
					

----- 8 ������� -----

select ������.[ID ������], ������.[�������� ������],������.����, ������.[���������� ����������� ������]
	from ������
		inner join ������
			on ������.[ID ������] = ������.[ID ������]
				where ������.���� <
				ANY(select ������.���� from ������
						where ������.[�������� ������] like '%�����%') and ������.[�������� ������] like '%�����%'

----- 10 ������� -----

use UNIVER;
select a.IDSTUDENT, a.NAME, a.BDAY
	from STUDENT a
		where exists (select * from STUDENT aa where a.BDAY = aa.BDAY and a.IDSTUDENT != aa.IDSTUDENT)
	order by a.BDAY