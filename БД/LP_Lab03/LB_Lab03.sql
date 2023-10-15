use master
create database T_MyBase2
on primary
(name = N'T_MyBase_mdf', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_mdf.mdf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_ndf', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%),
filegroup FG1
(name = N'T_MyBase_fg1_1', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_fg1_1.ndf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_fg1_2', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_fg1_2.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%),
filegroup FG2	
(name = N'T_MyBase_fg2_1', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_fg2_1.ndf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_fg2_2', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_fg2_2.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%),
filegroup FG3	
(name = N'T_MyBase_fg3_1', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_fg3_1.ndf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_fg3_2', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_fg3_2.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%)
log on
(name = N'T_MyBase_log', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_log.ldf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%)

go

use T_MyBase2;
CREATE table ТОВАРЫ /* создание таблицы со столбцами */
(	Название_товара nvarchar(50) not null, /* не допускает null */
	Цена real not null,
	Количество_на_складе int not null,
	id_товара int primary key not null /* первичный ключ */
) on FG1;

go

CREATE table КЛИЕНТЫ
(
	Фамилия_клиента nvarchar(30) not null,
	Имя nvarchar(30) not null,
	Отчество nvarchar(30) not null,
	Адрес nvarchar(30) not null,
	Телефон nchar(12) primary key not null,
	Email nchar(30) not null
) on FG2;

go

CREATE table ЗАКАЗЫ
(	Номер_заказа int primary key not null,
	id_товара int not null foreign key references ТОВАРЫ(id_товара), /* внешний ключ */
	Цена_заказанного_товара real not null,
	Количество_заказанного_товара int not null,
	Дата_продажи date not null,
	Телефон_заказчика nchar(12) not null foreign key references КЛИЕНТЫ(Телефон)
) on FG3;

ALTER table ТОВАРЫ ADD Дата_поступления date; /* обычное добавление */

ALTER table КЛИЕНТЫ ADD Пол nchar(1) not null, /* добавление с ограничениями */
CONSTRAINT DF_Клиенты_Пол1 default 'м' FOR Пол, 
CONSTRAINT DF_Клиенты_Пол2 check (ПОЛ in ('м', 'ж'));

ALTER table ТОВАРЫ DROP Column Дата_поступления; /* обычное удаление */

ALTER table КЛИЕНТЫ DROP CONSTRAINT DF_Клиенты_Пол1; /* удаление ограничений */
ALTER table КЛИЕНТЫ DROP CONSTRAINT DF_Клиенты_Пол2;
ALTER table КЛИЕНТЫ DROP Column Пол;

INSERT into Товары(id_товара,Количество_на_складе,Название_товара,Цена) /* вставка данных в таблицы */
	Values(1, 200, 'Телефон', 100),
		  (2, 300, 'Ноутбук', 2000),
		  (3, 180, 'Холодильник', 1000),
		  (5, 50, 'IPHONE 1', 680),
		  (6, 50, 'IPHONE 3', 680),
		  (7, 50, 'IPHONE 10', 680),
		  (8, 50, 'IPHONE 4', 680),
		  (9, 50, 'IPHONE 5', 680);

INSERT into КЛИЕНТЫ(Фамилия_клиента, Имя, Отчество, Телефон, Email, Адрес)
	Values('Тараканов', 'Никита', 'Сергеевич', '375257411803', 'chernaya@gmail.com', 'Belarus'),
		  ('Птенчик', 'Мария', 'Федоровна', '375298795643', 'belaya@gmail.com', 'Russia'),
		  ('Тушканчик', 'Николай', 'Петрович', '375440982389', 'tushkanchik222@gmail.com', 'Moldovia');

INSERT into ЗАКАЗЫ(id_товара,Дата_продажи,Количество_заказанного_товара,Номер_заказа,Телефон_заказчика,Цена_заказанного_товара)
	Values(1, '07.02.2023', 1, 1,375257411803,100),
		  (4, '20.03.2023', 2, 2, 375440982389,680);

SELECT id_товара, Дата_продажи /* обычный вывод */
FROM ЗАКАЗЫ

SELECT id_товара, Название_товара [Дешевые_товары] /* вывод с фильтром и псевдонимом */
FROM ТОВАРЫ
WHERE Цена < 1000

SELECT count(*)[Количество_строк] /* вывод количества строк */
FROM ТОВАРЫ

UPDATE ТОВАРЫ set Цена = Цена + 100 WHERE Цена < 1000 /* изменение значения в столбце */

SELECT * FROM ТОВАРЫ

DELETE FROM ТОВАРЫ Where Цена = 1000 /* удаление строки */

SELECT * FROM ТОВАРЫ

SELECT * FROM ТОВАРЫ /* оператор IN */
WHERE id_товара IN (1, 4)

SELECT * FROM ТОВАРЫ /* оператор NOT */
WHERE id_товара NOT IN (1, 4)

SELECT * FROM ТОВАРЫ /* BETWEEN */
WHERE Количество_на_складе BETWEEN 40 AND 210

SELECT * FROM ТОВАРЫ /* LIKE */
WHERE Название_товара LIKE 'IPHONE [1-5]'


