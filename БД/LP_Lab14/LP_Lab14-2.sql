use T_MyBase;

go

----- 1 ������� ------

create function COUNT_TOVAR(@zakazchik varchar(20)) returns int
as
begin
	declare @count int = (select count(*)
		from ������ f inner join ������ g
			on f.[ID ������] = g.[ID ������]
		where g.[������� ���������] = @zakazchik);
	return @count;
end;

declare @resultFunc int = dbo.COUNT_TOVAR('375257630238');
print('���������� ������� �� ������ 375257630238  : ' + cast(@resultFunc as varchar(3)));

drop function COUNT_TOVAR;

----- 1-2 ������� ------

alter function COUNT_TOVAR(@zakazchik varchar(20), @date varchar(20)) returns int
as
begin
	declare @count int = (select count(*)
		from ������ f inner join ������ g
			on f.[ID ������] = g.[ID ������]
		where g.[������� ���������] = @zakazchik and g.[���� �������] = cast(@date as datetime));
	return @count;
end;

declare @resultFunc int = dbo.COUNT_TOVAR('����', '2023-03-01');
print('���������� ������� �� ������ 375257630238 : ' + cast(@resultFunc as varchar(3)));

----- 2 ������� ------

create function GET_TOVAR(@t varchar(20)) returns varchar(300)
as
begin
	declare getStr cursor local static
				for select t.[�������� ������]
						from ������ t inner join ������ z
							on t.[ID ������] = z.[ID ������]
								where z.[������� ���������] = @t;
	declare @retStr varchar(300) = '',
			@locStr varchar(30) = '';
	open getStr;
	fetch getStr into @locStr;
	while @@FETCH_STATUS = 0
	begin
		set @retStr = concat(@locStr, ', ', @retStr);
		fetch getStr into @locStr;
	end;
	close getStr;
	return @retStr;
end;

select ���������.�������, dbo.GET_TOVAR(�������)[���������� �����] from ���������

drop function GET_TOVAR;

----- 3 ������� ----

create function TTOVAR(@number varchar(20), @email varchar(40)) returns table
as return 
(select z.[������� ���������], t.[�������� ������]
					from ������ t left outer join ������ z
						on t.[ID ������]= z.[ID ������]
							inner join ��������� zz
						on z.[������� ���������] = zz.�������
							where z.[������� ���������] = isnull(@number, z.[������� ���������])
									and zz.Email = isnull(@email, zz.Email));


select * from dbo.TTOVAR(NULL, NULL);
select * from dbo.TTOVAR('375257630238', NULL);
select * from dbo.TTOVAR(NULL, 'o0my@gmail.com');
select * from dbo.TTOVAR('375292922803', 'jirbold@gmail.com');

drop function TTOVAR;

---- 4 ������� ----

create function TCTOVAR(@id int) returns int
as
begin
	declare @count int = (select count(*) 
							from ������ p inner join ������ t
								on t.[ID ������] = p.[ID ������]
							where t.[ID ������] = isnull(@id, p.[ID ������]));
	return @count;
end;

select ������.[ID ������], dbo.TCTOVAR([ID ������])[���������� �������] from ������;
select dbo.TCTOVAR(NULL) [���������� �������]

drop function TCTOVAR;