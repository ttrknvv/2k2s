------- 7 ������� ------

use UNIVER

select 
(select trim(f.FACULTY) '@���', count(p.PULPIT) '����������_������',
(select trim(pp.PULPIT) '@���', 
(select  trim(t.TEACHER) '@���', t.TEACHER_NAME '���', t.GENDER '���'
from TEACHER t where t.PULPIT = pp.PULPIT 
for xml PATH('�������������'), root('�������������'), type)
from PULPIT pp
where pp.FACULTY = f.FACULTY for xml PATH('�������'), root('�������'), type)
for xml PATH('���������'), type)
	from FACULTY f inner join PULPIT p
		on f.FACULTY = p.FACULTY
			group by f.FACULTY for xml PATH(''),
			root('�����������'), type;

