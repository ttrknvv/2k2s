---------------- GROUP BY -------------------

use T_MyBase

-------- 1 ������� -------

select ������.[�������� ������],
		max(������.����)[������������ ���������],
		min(������.����)[����������� ���������],
		avg(������.����)[������� ���������],
		sum(������.����)[��������� ���������],
		count(*) [����� ���������� �������]
	from ������ inner join ������
		on ������.[ID ������] = ������.[ID ������]
	group by ������.[�������� ������]

-------- 2 ������� -------

select ������.[�������� ������],
		max(������.����) as '������������ ���������',
		min(������.����) as '����������� ���������',
		avg(������.����) as '������� ���������',
		sum(������.����) as '��������� ���������',
		count(*)  as '����� ���������� �������'
	from ������ inner join ������
		on ������.[ID ������] = ������.[ID ������]
	group by ������.[�������� ������]

-------- 3 ������� -------

select *
	from(select case
			when ������.���� between 50 and 1000 then '����� 50 � 1000'
			when ������.���� between 1000 and  2000 then '����� 1000 � 2000'
			else '���������'
			end[���������� ���], count(*)[���������� �������] 
			from ������ group by case
			when ������.���� between 50 and 1000 then '����� 50 � 1000'
			when ������.���� between 1000 and  2000 then '����� 1000 � 2000'
			else '���������'
			end) as T
				order by case [���������� ���]
			when '����� 50 � 1000' then 3
			when '����� 1000 � 2000' then 2
			when '���������' then 1
			else 0 end

-------- 4 ������� -------

select t.[�������� ������], round(avg(cast(z.[���������� ����������� ������] as float(4))), 2)[������� ����������]
	from ������ as t
		inner join ������ as z
			on t.[ID ������] = z.[ID ������]
		group by t.[�������� ������]
	
-------- 5 ������� -------

select t.[�������� ������], round(avg(cast(z.[���������� ����������� ������] as float(4))), 2)[������� ����������]
	from ������ as t
		inner join ������ as z
			on t.[ID ������] = z.[ID ������]
		where t.[�������� ������] like '%���%'
		group by t.[�������� ������]

-------- 6 ������� -------

select t.[�������� ������], round(avg(cast(z.[���������� ����������� ������] as float(4))), 2)[������� ����������]
	from ������ as t
		inner join ������ as z
			on t.[ID ������] = z.[ID ������]
		where z.[������� ���������] like '37529%'
		group by t.[�������� ������]

-------- 7 ������� -------

select t.[�������� ������], (select count(*) from ������ tt where t.[ID ������] = tt.[ID ������]
								and t.[�������� ������] like '%���%') [����������]
								from ������ as t
								group by t.[ID ������], t.[�������� ������]
								having t.[�������� ������] like '%���%'
