---------- 1 ������� ----------

use UNIVER;

declare Subjects cursor 
					for select s.SUBJECT
						from PULPIT p inner join SUBJECT s
							on s.PULPIT = p.PULPIT
								where p.PULPIT like '����'
declare @data_single varchar(10) = '',
		@result_string varchar(500) = '';
open Subjects;
fetch Subjects into @data_single;
print '������ ��������� �� ������� ����: ';
while @@fetch_status = 0
begin
	set @result_string = rtrim(@data_single) + ' , ' + @result_string;
	fetch Subjects into @data_single;
end;
print @result_string;
close Subjects;

------- 2 ������� -------

---- ��������� -----

declare Teachers cursor local 
					for select t.TEACHER_NAME
						from TEACHER t inner join PULPIT p
							on t.PULPIT = p.PULPIT
								where p.PULPIT like '����';
declare @tname varchar(30) = '';
open Teachers;
fetch Teachers into @tname;
print('1: ' + @tname);
go
declare @tname varchar(30) = ''; --- �� ����������
fetch Teachers into @tname;
print('2: ' + @tname);

---- ���������� -----

declare Teachers cursor global 
					for select t.TEACHER_NAME
						from TEACHER t inner join PULPIT p
							on t.PULPIT = p.PULPIT
								where p.PULPIT like '����';
declare @tname varchar(30) = '';
open Teachers;
fetch Teachers into @tname;
print('1: ' + @tname);
go
declare @tname varchar(30) = ''; --- �� ����������
fetch Teachers into @tname;
print('2: ' + @tname);
close Teachers;
deallocate Teachers; ---- ������������ ��������
go;

------ 3 ������� ------

----- ����������� ------

declare groups cursor local static 
				for select p.PROFESSION_NAME
					from dbo.PROFESSION p
							where p.FACULTY like '��';
declare @result varchar(500) = '', 
		@stroke varchar(60) = '';
open groups;
print '���������� �����: ' + cast(@@cursor_rows as varchar(5));
insert PROFESSION
	values('22', '��', '� ����������� ������', '���')
fetch groups into @stroke;
while @@fetch_status = 0
begin
	set @result = rtrim(@stroke) + ' , ' + @result;
	fetch groups into @stroke;
end;
print(@result);
delete PROFESSION where PROFESSION.PROFESSION like '22';

----- ������������ ------

declare groups cursor local dynamic 
				for select p.PROFESSION_NAME
					from dbo.PROFESSION p
							where p.FACULTY like '��';
declare @result varchar(500) = '', 
		@stroke varchar(60) = '';
open groups;
print '���������� �����: ' + cast(@@cursor_rows as varchar(5));
insert PROFESSION
	values('22', '��', '� ������������ ������', '���')
fetch groups into @stroke;
while @@fetch_status = 0
begin
	set @result = rtrim(@stroke) + ' , ' + @result;
	fetch groups into @stroke;
end;
print(@result);
close groups;
delete PROFESSION where PROFESSION.PROFESSION like '22';

------ 4 ������� ----

declare groups cursor local dynamic scroll
				for select row_number() over(order by f.FACULTY_NAME) N, f.FACULTY_NAME
					from FACULTY f
declare @stroke varchar(60) = '',
		@n varchar(2) = '';
open groups;
fetch groups into @n, @stroke;
print(@n + ') ' + @stroke);

fetch next from groups into @n, @stroke;
print(@n + ') ' + @stroke);

fetch prior from groups into @n, @stroke;
print(@n + ') ' + @stroke);

fetch absolute 2 from groups into @n, @stroke;
print(@n + ') ' + @stroke);

fetch absolute -2 from groups into @n, @stroke;
print(@n + ') ' + @stroke);

fetch relative 2 from groups into @n, @stroke;
print(@n + ') ' + @stroke);

fetch relative -1 from groups into @n, @stroke;
print(@n + ') ' + @stroke);

---- 5 ������� ----

insert PROFESSION
	values('22', '��', '� ������������ ������', '���')
insert PROFESSION
	values('223', '��', '� ������������ ������2', '���2')
declare @prof varchar(40) = '',
		@id_prof varchar(5) = '';			
declare test cursor local dynamic
			for select p.PROFESSION, p.PROFESSION_NAME
				from PROFESSION p 
					where p.PROFESSION like '22' or p.PROFESSION like '223' for update;
open test;
fetch test into @id_prof, @prof;
print(@id_prof + ' - ' + @prof);
delete PROFESSION where current of test;
select * from PROFESSION p where p.PROFESSION like '22';
fetch test into @id_prof, @prof;
print(@id_prof + ' - ' + @prof);
update PROFESSION set PROFESSION.PROFESSION = '323' where current of test;
select * from PROFESSION p where p.PROFESSION like '323';
close test;
delete PROFESSION where PROFESSION.PROFESSION like '323';

------ 6-1 ������� ------

declare @idStudent varchar(50) = '',
		@note int,
		@subject varchar(10) = '',
		@datet datetime;
declare test cursor local dynamic
				for select p.IDSTUDENT, p.NOTE, p.PDATE, p.SUBJECT
					from GROUPS g inner join STUDENT s
						on g.IDGROUP = g.IDGROUP
						inner join PROGRESS p
						on p.IDSTUDENT = s.IDSTUDENT and s.IDGROUP = g.IDGROUP
							where p.NOTE = 4 for update;
open test;
fetch test into @idStudent, @note, @datet, @subject;
print(@idStudent + ' ' + cast(@note as varchar(2)) + ' ' + cast(@datet as varchar(10)) + ' ' + @subject);
delete PROGRESS where current of test;
select p.IDSTUDENT, p.NOTE, p.PDATE, p.SUBJECT
					from GROUPS g inner join STUDENT s
						on g.IDGROUP = g.IDGROUP
						inner join PROGRESS p
						on p.IDSTUDENT = s.IDSTUDENT and s.IDGROUP = g.IDGROUP
							where p.NOTE = 4;
close test;

------ 6-2 ������� ------

declare @idStudent varchar(50) = '',
		@note int,
		@subject varchar(10) = '',
		@datet datetime;
declare test2 cursor local dynamic 
				for select p.IDSTUDENT, p.NOTE, p.PDATE, p.SUBJECT
					from PROGRESS p
						where p.IDSTUDENT = 1005;
open test2;
fetch test2 into @idStudent, @note, @datet, @subject;
print(@idStudent + ' ' + cast(@note as varchar(2)) + ' ' + cast(@datet as varchar(10)) + ' ' + @subject);
update PROGRESS set PROGRESS.NOTE = PROGRESS.NOTE + 1 where current of test2;
select p.IDSTUDENT, p.NOTE, p.PDATE, p.SUBJECT
					from PROGRESS p
						where p.IDSTUDENT = 1005;