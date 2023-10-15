use master;
go
create database T_MyBase
on primary
(name = N'T_MyBase_mdf', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_mdf.mdf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
filegroup FG1
(name = N'T_MyBase_ndf_fg1_1', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf_fg1_1.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf_fg1_2', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf_fg1_2.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
filegroup FG2
(name = N'T_MyBase_ndf_fg2_1', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf_fg2_1.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf_fg2_2', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf_fg2_2.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
filegroup FG3
(name = N'T_MyBase_ndf_fg3_1', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf_fg3_1.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf_fg3_2', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_ndf_fg3_2.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB)
log on
(name = N'T_MyBase_log', filename = N'D:\2k2s\БД\LP_Lab03\T_MyBase_log.ldf',
size = 1024KB, maxsize = 1GB, filegrowth = 25%)

go

use T_MyBase;
create table ТОВАРЫ
(
	[ID товара] int not null IDENTITY(1, 1) primary key,
	[Название товара] nvarchar(50) not null,
	[Количество на складе] int not null,
	Цена real not null
);

create table ЗАКАЗЧИКИ
(
	Фамилия nvarchar(50) not null,
	Имя nvarchar(50) not null,
	Отчество nvarchar(50) not null,
	Адрес nvarchar(70) not null,
	Телефон nchar(15) not null primary key,
	Email nchar(70) not null,
	[Признак скидки] bit not null constraint ZAKAZCH_CONS default(0)
)

go

create table ЗАКАЗЫ
(
	[ID товара] int not null foreign key references ТОВАРЫ([ID товара]),
	[Телефон заказчика] nchar(15) not null foreign key references ЗАКАЗЧИКИ(Телефон),
	[Количество заказанного товара] int not null constraint ZAKAZ_CONS default(1),
	[Дата продажи] datetime not null constraint ZAKAZ_CONS2 default(getdate())
)

use T_MyBase;
insert into ТОВАРЫ([Количество на складе], [Название товара], Цена)
	values(500, 'Электрический котел', 2356.83),
		  (100, 'Газовый котел', 2902.50),
		  (50, 'Водонагреватель', 1526.50),
		  (900, 'Биметаллический радиатор', 51.90),
		  (569, 'Поверхостный насос', 1794.91),
		  (398, 'Теплоноситель', 602.00),
		  (298, 'Скважинный насос', 2545.34),
		  (200, 'Apple iPhone 14 PRO', 3400.00),
		  (349, 'Samsung Galaxy Z Fold4', 4000.00),
		  (192, 'Apple Watch Ultra LTE 49', 2490.00)

insert into ЗАКАЗЧИКИ(Фамилия, Имя, Отчество, Телефон, Адрес, Email, [Признак скидки])
	values('Мельникова', 'Ксения', 'Витальевна', '375251828727', 'Челябинская область, город Мытищи, шоссе Ленина, 93', 'hr6zdl@yandex.ru',0),
		  ('Иванова', 'София', 'Сергеевна', '375292728764', 'Орловская область, город Серпухов, шоссе Космонавтов, 65', '281av0@gmail.com',0),
		  ('Буракшаева', 'Юлия', 'Ивановна', '375257263863', 'Самарская область, город Можайск, наб. Ленина, 38', 'pa5h@mail.ru', 1),
		  ('Фурсова', 'Елизавета', 'Владимировна', '375443059257', 'Волгоградская область, город Кашира, бульвар Космонавтов, 07', 'sfn13i@mail.ru',0),
		  ('Сапсай', 'Иван', 'Алексеевич', '375332766145', 'Ярославская область, город Солнечногорск, въезд Славы, 22', 'rv7bp@gmail.com',1),
		  ('Богословский', 'Артем', 'Михайлович', '375445712340', 'Калининградская область, город Зарайск, въезд 1905 года, 55', 'er@gmail.com',0),
		  ('Самбикина', 'Юлия', 'Владимировна', '375291410953', 'Калининградская область, город Серпухов, пл. Ленина, 51', 'o0my@gmail.com',0),
		  ('Шпак', 'Ангелина', 'Эдуардовна', '375443892294', 'Курганская область, город Луховицы, ул. Чехова, 75', '715qy08@gmail.com',0),
		  ('Пименов', 'Максим', 'Евгеньевич', '375253556370', 'Смоленская область, город Коломна, ул. Ломоносова, 20', 'vubx0t@mail.ru',0),
		  ('Сигида', 'Валерия', 'Романовна', '375440493507', 'Псковская область, город Чехов, пер. Балканская, 52', 'gq@yandex.ru',0),
		  ('Миронова', 'Елизавета', 'Валерьевна', '375332775510', 'Брянская область, город Ступино, спуск Сталина, 07', 'o7khr@yandex.ru',0),
		  ('Безуглова', 'Анастасия', 'Александровна', '375441294868', 'Иркутская область, город Одинцово, проезд Космонавтов, 84', 'k8sjebg1y@mail.ru',1),
		  ('Сергеева ', 'Мария', 'Вячеславовна', '375292922803', 'Тверская область, город Шаховская, проезд Будапештсткая, 41', 'jirbold@gmail.com',0),
		  ('Перфильева', 'Милена', 'Егоровна', '375257630238', 'Сахалинская область, город Клин, пр. Ломоносова, 48', 'wyalkxfde@gmail.com',1)

go

insert into ЗАКАЗЫ([ID товара], [Дата продажи], [Количество заказанного товара], [Телефон заказчика])
	values(2,'07.03.2023',1,'375291410953'),
		  (9,'02.03.2023',2,'375440493507'),
		  (1,'01.03.2023',1,'375257630238'),
		  (8,'22.02.2023',3,'375292922803'),
		  (3,'30.01.2023',4,'375257263863'),
		  (6,'27.02.2023',1,'375251828727'),
		  (3,'13.02.2023',2,'375257263863'),
		  (5,'02.03.2023',2,'375292728764'),
		  (1,'01.03.2023',2,'375291410953'),
		  (2,'10.02.2023',8,'375292922803'),
		  (9,'11.02.2023',10,'375291410953'),
		  (10,'22.02.2023',2,'375251828727'),
		  (3,'07.03.2023',3,'375332766145')