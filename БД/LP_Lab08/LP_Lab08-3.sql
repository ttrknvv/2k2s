----------- 8 задание -----------

use UNIVER;

create view [Занятые аудитории]
	as select top 50 t.DAYWEEK[День], t.PAIR[Пара], t.AUDITORIUM[Аудитория]
		from TIMETABLE as t
			order by t.PAIR

select * from [Занятые аудитории]

drop view [Занятые аудитории]


	------- сколько аудиторий занято на определенной паре
	
select DAYWEEK, [1], [2], [3], [4]
	from (select DAYWEEK, PAIR, AUDITORIUM from TIMETABLE) as a
	PIVOT 
	(
		count(AUDITORIUM) for PAIR in ([1], [2], [3], [4])
	) as p

		------ Сколько аудиторий занято в определенный день

select PAIR, [2023-03-12], [2023-03-13], [2023-03-14], [2023-03-15], [2023-03-16]
	from (select PAIR, DAYWEEK, AUDITORIUM from TIMETABLE) as a
	PIVOT 
	(
		count(AUDITORIUM) for DAYWEEK in ([2023-03-12], [2023-03-13], [2023-03-14], [2023-03-15], [2023-03-16])
	) as p


use T_MyBase;

select avgg as ' ', [Электрический котел], [Газовый котел], [Водонагреватель], 
		[Apple iPhone 14 PRO], [Поверхостный насос], [Теплоноситель], [Apple Watch Ultra LTE 49]
	from (select 'Количество продаж' as 'avgg', [Название товара], [Количество заказанного товара]
			from ТОВАРЫ inner join ЗАКАЗЫ on ТОВАРЫ.[ID товара] = ЗАКАЗЫ.[ID товара]) as t
	PIVOT
	(
		sum([Количество заказанного товара]) for [Название товара] in ([Электрический котел], [Газовый котел], 
		[Водонагреватель], [Apple iPhone 14 PRO], [Поверхостный насос], [Теплоноситель], [Apple Watch Ultra LTE 49])
	) as p


		