----- 8 задание -----

use UNIVER;

create procedure PRINT_REPORT @f char(10) = null, @p char(10) = null
as
begin
	begin try

declare @faculty char(10) = '',
		@facultyNow char(10) = '',
		@pulpit varchar(30) = '',
		@pulpitNow varchar(30) = '',
		@count int = 0,
		@subject varchar(300) = '',
		@subjectNow varchar(20) = '',
		@flag int = 0,
		@countRet int = 0;
		
		if(@f is not null and @p is null) ---- для заданного факультета
		begin
			declare test cursor local static 
				for select f.FACULTY, p.PULPIT, count(t.TEACHER)[Количество преподавателй], s.SUBJECT
					from FACULTY f full outer join PULPIT p
						on f.FACULTY = p.FACULTY
					full outer join SUBJECT s
						on s.PULPIT = p.PULPIT
					full outer join TEACHER t
						on t.PULPIT = p.PULPIT
					group by f.FACULTY, p.PULPIT, s.SUBJECT having(f.FACULTY like @f)
			open test;
			fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
			print('Факультет : ' + @facultyNow);
			while @@FETCH_STATUS = 0
			begin
				if(@pulpitNow is not null and @pulpitNow not like @pulpit)
				begin
					set @pulpit = @pulpitNow;
					set @countRet = @countRet + 1;
					if(@flag = 1)
					begin
						if(@subject like '' or @subject is null)
						begin
							print(space(10) + 'Дисциплины : нет');
						end
						else
						begin
							print(space(10) + 'Дисциплины : ' + @subject);
						end;
						set @subject = '';
					end;
					set @flag = 1;
					print(space(5) + 'Кафедра : ' + @pulpitNow);
					print(space(10) + 'Количество преподавателей : ' + cast(@count as varchar(3)));
					set @subject = @subjectNow;
				end;
				else if(@pulpitNow like @pulpit)
				begin
					set @subject = concat(trim(@subjectNow), ', ', @subject);
				end;
				fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
			end;
			if(@subject like '' or @subject is null)
			begin
				print(space(10) + 'Дисциплины : нет');
			end
			else
			begin
				print(space(10) + 'Дисциплины : ' + @subject);
			end;
		end;

		else if(@f is null and @p is not null) ----- для определенной кафедры
		begin
			declare test cursor local static 
				for select f.FACULTY, p.PULPIT, count(t.TEACHER)[Количество преподавателй], s.SUBJECT
					from FACULTY f full outer join PULPIT p
						on f.FACULTY = p.FACULTY
					full outer join SUBJECT s
						on s.PULPIT = p.PULPIT
					full outer join TEACHER t
						on t.PULPIT = p.PULPIT
					group by f.FACULTY, p.PULPIT, s.SUBJECT having(p.PULPIT like @p)
			open test;
			fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
			if(@facultyNow is null)
			begin
				RAISERROR('Неправильно задан параметр!', 11, 1);
			end;
			print('Факультет : ' + @facultyNow);
			print(space(5) + 'Кафедра : ' + @pulpitNow);
			print(space(10) + 'Количество преподавателей : ' + cast(@count as varchar(3)));
			set @countRet = @countRet + 1;
			while(@@FETCH_STATUS = 0)
			begin
				if(@subjectNow is not null)
				begin
					set @subject = concat(trim(@subjectNow), ', ', @subject);
				end
				fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
			end
			if(@subject like '' or @subject is null)
			begin
				print(space(10) + 'Дисциплины : нет');
			end
			else
			begin
				print(space(10) + 'Дисциплины : ' + @subject);
			end;
		end;

		else if(@f is not null and @p is not null)
		begin
			declare test cursor local static 
				for select f.FACULTY, p.PULPIT, count(t.TEACHER)[Количество преподавателй], s.SUBJECT
					from FACULTY f full outer join PULPIT p
						on f.FACULTY = p.FACULTY
					full outer join SUBJECT s
						on s.PULPIT = p.PULPIT
					full outer join TEACHER t
						on t.PULPIT = p.PULPIT
					group by f.FACULTY, p.PULPIT, s.SUBJECT having(p.PULPIT like @p and f.FACULTY like @f)
			open test;
			fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
			if(@facultyNow like '' and @pulpitNow like '')
			begin
				RAISERROR('Неправильно заданы параметры!', 11, 1);
			end;
			print('Факультет : ' + @facultyNow);
			print(space(5) + 'Кафедра : ' + @pulpitNow);
			print(space(10) + 'Количество преподавателей : ' + cast(@count as varchar(3)));
			set @countRet = @countRet + 1;
			while(@@FETCH_STATUS = 0)
			begin
				if(@subjectNow is not null)
				begin
					set @subject = concat(trim(@subjectNow), ', ', @subject);
				end
				fetch test into @facultyNow, @pulpitNow, @count, @subjectNow;
			end
			if(@subject like '' or @subject is null)
			begin
				print(space(10) + 'Дисциплины : нет');
			end
			else
			begin
				print(space(10) + 'Дисциплины : ' + @subject);
			end;
		end;

		else
		begin
			RAISERROR('Не заданы параметры!', 11, 1);
		end;
		close test;
		return @countRet;
	end try

	begin catch
		print('Номер ошибки : ' + cast(error_number() as varchar(6)));
		print('Сообщение : ' + error_message());
		print('Уровень : ' + cast(error_severity() as varchar(6)));
		print('Метка : ' + cast(error_state() as varchar(8)));
		print('Номер строки : ' + cast(error_line() as varchar(8)));
		if(error_procedure() is not null)
		begin
			print('Имя процедуры : ' + error_procedure());
		end;
		return -1;
	end catch
end;

declare @rc int;

exec @rc = PRINT_REPORT @f = 'ИТ';
print('Количество кафедр : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORT @p = 'ИСиТ';
print('Количество кафедр : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORT @f = 'ЛХФ', @p = 'ЛЗиДВ';
print('Количество кафедр : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORT;
print('Количество кафедр : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORT @f = 'ИТ', @p = 'ДЗиДВ';
print('Количество кафедр : ' + cast(@rc as varchar(3)));

drop procedure PRINT_REPORT;