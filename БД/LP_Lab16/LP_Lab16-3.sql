------- 7 задание ------

use UNIVER

select 
(select trim(f.FACULTY) '@код', count(p.PULPIT) 'количество_кафедр',
(select trim(pp.PULPIT) '@код', 
(select  trim(t.TEACHER) '@код', t.TEACHER_NAME 'имя', t.GENDER 'пол'
from TEACHER t where t.PULPIT = pp.PULPIT 
for xml PATH('преподаватель'), root('преподаватели'), type)
from PULPIT pp
where pp.FACULTY = f.FACULTY for xml PATH('кафедра'), root('кафедры'), type)
for xml PATH('факультет'), type)
	from FACULTY f inner join PULPIT p
		on f.FACULTY = p.FACULTY
			group by f.FACULTY for xml PATH(''),
			root('университет'), type;

