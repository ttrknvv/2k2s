----- 11 задание ----

use T_MyBase;

create table WEATHER
(
	town varchar(50),
	start_date datetime,
	last_date datetime,
	tempreture int
)

create trigger tt on WEATHER instead of insert, update
as
begin
	declare testt cursor local static
		for select w.start_date, w.last_date from WEATHER w
	declare @mainStart datetime,
			@mainLast datetime,
			@n int = 0;
	declare @secStart datetime = (select start_date from inserted),
			@secLast datetime = (select last_date from inserted);
	if(@secStart > @secLast)
	begin
		raiserror('Валидация дат не пройдена!111', 16, 1);
		rollback;
	end;
	open testt;
	print(cast(@mainStart as varchar(10)));
	if(@mainStart = '' or @mainLast = '')
	begin
		return;
	end;
	fetch testt into @mainStart, @mainLast;
	while @@FETCH_STATUS = 0
	begin
		set @n = (select count(*) from WEATHER w where w.last_date = @secLast and w.start_date = @secStart);
		print(cast(@n as varchar(30)));
		if(@mainLast = @secLast and @mainStart = @secStart)
		begin
			if(@n = 1)
			begin
				raiserror('Валидация дат не пройдена!444', 16, 1);
				rollback;
			end;
		end;
		else if(@secStart >= @mainStart and @secStart <= @mainLast)
		begin
			raiserror('Валидация дат не пройдена!222', 16, 1);
			rollback;
		end;
		else if(@mainLast >= @secStart and @mainLast <= @secLast)
		begin
			raiserror('Валидация дат не пройдена!333', 16, 1);
			rollback;
		end;
		else if(@secLast > @mainStart and @secLast < @mainLast)
		begin
			raiserror('Валидация дат не пройдена!555', 16, 1);
			rollback;
		end;
		
		fetch testt into @mainStart, @mainLast;
	end;
	close testt;
	return;
end;

insert WEATHER 
	values('Слуцк', CONVERT(datetime, '17.04.2023 17:17'), CONVERT(datetime, '17.04.2023 23:17'), -2);

insert WEATHER 
	values('Слуцк', CONVERT(datetime, '19.04.2023 17:17'), CONVERT(datetime, '11.04.2023 23:17'), -2);

insert WEATHER
	values('Слуцк', CONVERT(datetime, '20.04.2023 17:17'), CONVERT(datetime, '25.04.2023 23:17'), -2);

insert WEATHER
	values('Слуцк', CONVERT(datetime, '22.04.2023 17:17'), CONVERT(datetime, '29.04.2023 23:17'), -2)

insert WEATHER
	values('Слуцк', CONVERT(datetime, '23.04.2023 17:17'), CONVERT(datetime, '23.04.2023 23:17'), -2)

insert WEATHER
	values('Слуцк', CONVERT(datetime, '18.04.2023 17:17'), CONVERT(datetime, '23.04.2023 23:17'), -2)

insert WEATHER
	values('Слуцк', CONVERT(datetime, '19.04.2023 17:17'), CONVERT(datetime, '29.04.2023 23:17'), -2)

delete WEATHER

drop trigger tt;

