---------- 8 задание -------

select f.FACULTY, p.PULPIT, count(t.TEACHER)[Количество преподавателй], s.SUBJECT
	from FACULTY f full outer join PULPIT p
		on f.FACULTY = p.FACULTY
	full outer join SUBJECT s
		on s.PULPIT = p.PULPIT
	full outer join TEACHER t
		on t.PULPIT = p.PULPIT
		group by f.FACULTY, p.PULPIT, s.SUBJECT

use UNIVER;

declare test cursor local static 
			for select f.FACULTY, p.PULPIT, count(t.TEACHER)[Количество преподавателй], s.SUBJECT
	from FACULTY f full outer join PULPIT p
		on f.FACULTY = p.FACULTY
	full outer join SUBJECT s
		on s.PULPIT = p.PULPIT
	full outer join TEACHER t
		on t.PULPIT = p.PULPIT
		group by f.FACULTY, p.PULPIT, s.SUBJECT

declare @faculty varchar(30) = '',
		@facultyNow varchar(30) = '',
		@pulpit varchar(30) = '',
		@pulpitNow varchar(30) = '',
		@count int = 0,
		@subject varchar(300) = '',
		@subjectNow varchar(20) = '',
		@flag int = 0;

open test;
fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
while @@FETCH_STATUS = 0
begin
	if @facultyNow != @faculty and @facultyNow is not null
		begin
			if @subject = '' and @faculty != ''
				begin
					print(space(15) + 'Дисциплины: нет');
				end;
			else if @faculty != ''
				begin
					print(space(15) + 'Дисциплины: ' + @subject);
					set @subject = '';
				end;
			set @faculty = @facultyNow;
			print('Факультет: ' + @faculty);
			set @flag = 0;
		end;
	
	if @pulpitNow != @pulpit
		begin
			set @pulpit = @pulpitNow
			if @subject = '' and @flag = 1
				begin
					print(space(15) + 'Дисциплины: нет');
				end;
			else if @flag = 1
				begin
					print(space(15) + 'Дисциплины: ' + @subject);
					set @subject = '';
				end;
			set @flag = 1;
			print(space(10) + 'Кафедра: ' + @pulpit);
			print(space(15) + 'Количество преподаваталей: ' + cast(@count as varchar(2)));
			if @subjectNow != ''
				begin
					set @subject = concat(rtrim(@subjectNow), ltrim(@subject));
				end;
		end;
	else
		begin
			if @subjectNow != ''
				begin
					set @subject = concat(rtrim(@subjectNow), ' ,', @subject);
				end;
		end;
	fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
	if @@fetch_status != 0
		begin
			print(space(15) + 'Дисциплины: ' + @subject);
			set @subject = '';
		end;
end;
close test;