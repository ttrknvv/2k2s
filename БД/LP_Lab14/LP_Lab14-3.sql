----- 7 ������� ----

create function FFACPUL_DUBL(@faculty varchar(20), @pulpit varchar(20)) returns @te table	
																		(col1 varchar(20), col2 varchar(20))
as
begin
	declare cc cursor static
				for select f.FACULTY, p.PULPIT
					from FACULTY f left outer join PULPIT p
						on p.FACULTY = f.FACULTY
							where p.PULPIT like isnull(@pulpit, p.PULPIT)
									and f.FACULTY like isnull(@faculty, f.FACULTY);
	declare @f varchar(20), @p varchar(20);
	open cc;
	fetch cc into @f, @p;
	while @@FETCH_STATUS = 0
	begin
		insert @te values(@f, @p);
		fetch cc into @f, @p;
	end;
	close cc;
	return;
end;

drop function FFACPUL_DUBL;

create procedure PRINT_REPORTX @f char(10) = null, @p char(10) = null
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
		
		if(@f is not null and @p is null) ---- ��� ��������� ����������
		begin
			declare test cursor local static 
				for select f.FACULTY, (select top 1(select col2 from dbo.FFACPUL_DUBL(f.FACULTY, p.PULPIT))), dbo.FCTEACHER(p.PULPIT)[���������� �������������], dbo.FSUBJECT(p.PULPIT)
					from FACULTY f full outer join PULPIT p
						on f.FACULTY = p.FACULTY
					full outer join SUBJECT s
						on s.PULPIT = p.PULPIT
					full outer join TEACHER t
						on t.PULPIT = p.PULPIT
					group by f.FACULTY, p.PULPIT, s.SUBJECT having(f.FACULTY like @f)
			open test;
			fetch test into @facultyNow, @pulpitNow, @count, @subject;
			print('��������� : ' + @facultyNow);
			while @@FETCH_STATUS = 0
			begin
				if(@pulpit != @pulpitNow)
				begin
					set @countRet = @countRet + 1;
					print(space(5) + '������� : ' + @pulpitNow);
					set @pulpit = @pulpitNow;
					print(space(10) + '���������� �������������� : ' + cast(@count as varchar(3)));
					if(@subject is null or @subject = '')
					begin
						print(space(10) + '��������� ���������� : ���');
					end;
					else begin
						print(space(10) + '��������� ���������� : ' + @subject);
					end;
				end;
				fetch test into @facultyNow, @pulpitNow, @count, @subject;
			end;
		end;

		else if(@f is null and @p is not null) ----- ��� ������������ �������
		begin
			declare test cursor local static 
				for select f.FACULTY, (select top 1(select col2 from dbo.FFACPUL_DUBL(f.FACULTY, p.PULPIT))), dbo.FCTEACHER(p.PULPIT)[���������� �������������], dbo.FSUBJECT(p.PULPIT)
					from FACULTY f full outer join PULPIT p
						on f.FACULTY = p.FACULTY
					full outer join SUBJECT s
						on s.PULPIT = p.PULPIT
					full outer join TEACHER t
						on t.PULPIT = p.PULPIT
					group by f.FACULTY, p.PULPIT, s.SUBJECT having(p.PULPIT like @p)
			open test;
			fetch test into @facultyNow, @pulpitNow, @count, @subject;
			if(@facultyNow is null)
			begin
				RAISERROR('����������� ����� ��������!', 11, 1);
			end;
			print('��������� : ' + @facultyNow);
			print(space(5) + '������� : ' + @pulpitNow);
			set @countRet = @countRet + 1;
			print(space(10) + '���������� �������������� : ' + cast(@count as varchar(3)));
			if(@subject like '' or @subject is null)
			begin
				print(space(10) + '���������� : ���');
			end
			else
			begin
				print(space(10) + '���������� : ' + @subject);
			end;
		end;

		else if(@f is not null and @p is not null)
		begin
			declare test cursor local static 
				for select f.FACULTY, (select top 1(select col2 from dbo.FFACPUL_DUBL(f.FACULTY, p.PULPIT))), dbo.FCTEACHER(p.PULPIT)[���������� �������������], dbo.FSUBJECT(p.PULPIT)
					from FACULTY f full outer join PULPIT p
						on f.FACULTY = p.FACULTY
					full outer join SUBJECT s
						on s.PULPIT = p.PULPIT
					full outer join TEACHER t
						on t.PULPIT = p.PULPIT
					group by f.FACULTY, p.PULPIT, s.SUBJECT having(p.PULPIT like @p and f.FACULTY like @f)
			open test;
			fetch test into @facultyNow, @pulpitNow, @count, @subject;
			if(@facultyNow like '' and @pulpitNow like '')
			begin
				RAISERROR('����������� ������ ���������!', 11, 1);
			end;
			print('��������� : ' + @facultyNow);
			print(space(5) + '������� : ' + @pulpitNow);
			print(space(10) + '���������� �������������� : ' + cast(@count as varchar(3)));
			set @countRet = @countRet + 1;
			if(@subject like '' or @subject is null)
			begin
				print(space(10) + '���������� : ���');
			end
			else
			begin
				print(space(10) + '���������� : ' + @subject);
			end;
		end;

		else
		begin
			RAISERROR('�� ������ ���������!', 11, 1);
		end;
		close test;
		return @countRet;
	end try

	begin catch
		print('����� ������ : ' + cast(error_number() as varchar(6)));
		print('��������� : ' + error_message());
		print('������� : ' + cast(error_severity() as varchar(6)));
		print('����� : ' + cast(error_state() as varchar(8)));
		print('����� ������ : ' + cast(error_line() as varchar(8)));
		if(error_procedure() is not null)
		begin
			print('��� ��������� : ' + error_procedure());
		end;
		return -1;
	end catch
end;

declare @rc int;

exec @rc = PRINT_REPORTX @f = '��';
print('���������� ������ : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORTX @p = '����';
print('���������� ������ : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORTX @f = '���', @p = '�����';
print('���������� ������ : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORTX;
print('���������� ������ : ' + cast(@rc as varchar(3)));
print'';
print('-----------------------------------------------------------------------------');
print'';
exec @rc = PRINT_REPORTX @f = '��', @p = '�����';
print('���������� ������ : ' + cast(@rc as varchar(3)));

drop procedure PRINT_REPORTX;