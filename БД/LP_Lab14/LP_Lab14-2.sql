use T_MyBase;

go

----- 1 задание ------

create function COUNT_TOVAR(@zakazchik varchar(20)) returns int
as
begin
	declare @count int = (select count(*)
		from ТОВАРЫ f inner join ЗАКАЗЫ g
			on f.[ID товара] = g.[ID товара]
		where g.[Телефон заказчика] = @zakazchik);
	return @count;
end;

declare @resultFunc int = dbo.COUNT_TOVAR('375257630238');
print('Количество заказов по номеру 375257630238  : ' + cast(@resultFunc as varchar(3)));

drop function COUNT_TOVAR;

----- 1-2 задание ------

alter function COUNT_TOVAR(@zakazchik varchar(20), @date varchar(20)) returns int
as
begin
	declare @count int = (select count(*)
		from ТОВАРЫ f inner join ЗАКАЗЫ g
			on f.[ID товара] = g.[ID товара]
		where g.[Телефон заказчика] = @zakazchik and g.[Дата продажи] = cast(@date as datetime));
	return @count;
end;

declare @resultFunc int = dbo.COUNT_TOVAR('ИДиП', '2023-03-01');
print('Количество заказов по номеру 375257630238 : ' + cast(@resultFunc as varchar(3)));

----- 2 задание ------

create function GET_TOVAR(@t varchar(20)) returns varchar(300)
as
begin
	declare getStr cursor local static
				for select t.[Название товара]
						from ТОВАРЫ t inner join ЗАКАЗЫ z
							on t.[ID товара] = z.[ID товара]
								where z.[Телефон заказчика] = @t;
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

select ЗАКАЗЧИКИ.Телефон, dbo.GET_TOVAR(Телефон)[Заказанный товар] from ЗАКАЗЧИКИ

drop function GET_TOVAR;

----- 3 задание ----

create function TTOVAR(@number varchar(20), @email varchar(40)) returns table
as return 
(select z.[Телефон заказчика], t.[Название товара]
					from ТОВАРЫ t left outer join ЗАКАЗЫ z
						on t.[ID товара]= z.[ID товара]
							inner join ЗАКАЗЧИКИ zz
						on z.[Телефон заказчика] = zz.Телефон
							where z.[Телефон заказчика] = isnull(@number, z.[Телефон заказчика])
									and zz.Email = isnull(@email, zz.Email));


select * from dbo.TTOVAR(NULL, NULL);
select * from dbo.TTOVAR('375257630238', NULL);
select * from dbo.TTOVAR(NULL, 'o0my@gmail.com');
select * from dbo.TTOVAR('375292922803', 'jirbold@gmail.com');

drop function TTOVAR;

---- 4 задание ----

create function TCTOVAR(@id int) returns int
as
begin
	declare @count int = (select count(*) 
							from ТОВАРЫ p inner join ЗАКАЗЫ t
								on t.[ID товара] = p.[ID товара]
							where t.[ID товара] = isnull(@id, p.[ID товара]));
	return @count;
end;

select ТОВАРЫ.[ID товара], dbo.TCTOVAR([ID товара])[Количество заказов] from ТОВАРЫ;
select dbo.TCTOVAR(NULL) [Количество заказов]

drop function TCTOVAR;