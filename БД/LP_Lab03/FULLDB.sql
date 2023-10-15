use master;
go
create database T_MyBase
on primary
(name = N'T_MyBase_mdf', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_mdf.mdf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
filegroup FG1
(name = N'T_MyBase_ndf_fg1_1', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf_fg1_1.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf_fg1_2', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf_fg1_2.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
filegroup FG2
(name = N'T_MyBase_ndf_fg2_1', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf_fg2_1.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf_fg2_2', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf_fg2_2.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
filegroup FG3
(name = N'T_MyBase_ndf_fg3_1', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf_fg3_1.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB),
(name = N'T_MyBase_ndf_fg3_2', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf_fg3_2.ndf',
size = 1024KB, maxsize = UNLIMITED, filegrowth = 1024KB)
log on
(name = N'T_MyBase_log', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_log.ldf',
size = 1024KB, maxsize = 1GB, filegrowth = 25%)

go

use T_MyBase;
create table ������
(
	[ID ������] int not null IDENTITY(1, 1) primary key,
	[�������� ������] nvarchar(50) not null,
	[���������� �� ������] int not null,
	���� real not null
);

create table ���������
(
	������� nvarchar(50) not null,
	��� nvarchar(50) not null,
	�������� nvarchar(50) not null,
	����� nvarchar(70) not null,
	������� nchar(15) not null primary key,
	Email nchar(70) not null,
	[������� ������] bit not null constraint ZAKAZCH_CONS default(0)
)

go

create table ������
(
	[ID ������] int not null foreign key references ������([ID ������]),
	[������� ���������] nchar(15) not null foreign key references ���������(�������),
	[���������� ����������� ������] int not null constraint ZAKAZ_CONS default(1),
	[���� �������] datetime not null constraint ZAKAZ_CONS2 default(getdate())
)

use T_MyBase;
insert into ������([���������� �� ������], [�������� ������], ����)
	values(500, '������������� �����', 2356.83),
		  (100, '������� �����', 2902.50),
		  (50, '���������������', 1526.50),
		  (900, '��������������� ��������', 51.90),
		  (569, '������������ �����', 1794.91),
		  (398, '�������������', 602.00),
		  (298, '���������� �����', 2545.34),
		  (200, 'Apple iPhone 14 PRO', 3400.00),
		  (349, 'Samsung Galaxy Z Fold4', 4000.00),
		  (192, 'Apple Watch Ultra LTE 49', 2490.00)

insert into ���������(�������, ���, ��������, �������, �����, Email, [������� ������])
	values('����������', '������', '����������', '375251828727', '����������� �������, ����� ������, ����� ������, 93', 'hr6zdl@yandex.ru',0),
		  ('�������', '�����', '���������', '375292728764', '��������� �������, ����� ��������, ����� �����������, 65', '281av0@gmail.com',0),
		  ('����������', '����', '��������', '375257263863', '��������� �������, ����� �������, ���. ������, 38', 'pa5h@mail.ru', 1),
		  ('�������', '���������', '������������', '375443059257', '������������� �������, ����� ������, ������� �����������, 07', 'sfn13i@mail.ru',0),
		  ('������', '����', '����������', '375332766145', '����������� �������, ����� �������������, ����� �����, 22', 'rv7bp@gmail.com',1),
		  ('������������', '�����', '����������', '375445712340', '��������������� �������, ����� �������, ����� 1905 ����, 55', 'er@gmail.com',0),
		  ('���������', '����', '������������', '375291410953', '��������������� �������, ����� ��������, ��. ������, 51', 'o0my@gmail.com',0),
		  ('����', '��������', '����������', '375443892294', '���������� �������, ����� ��������, ��. ������, 75', '715qy08@gmail.com',0),
		  ('�������', '������', '����������', '375253556370', '���������� �������, ����� �������, ��. ����������, 20', 'vubx0t@mail.ru',0),
		  ('������', '�������', '���������', '375440493507', '��������� �������, ����� �����, ���. ����������, 52', 'gq@yandex.ru',0),
		  ('��������', '���������', '����������', '375332775510', '�������� �������, ����� �������, ����� �������, 07', 'o7khr@yandex.ru',0),
		  ('���������', '���������', '�������������', '375441294868', '��������� �������, ����� ��������, ������ �����������, 84', 'k8sjebg1y@mail.ru',1),
		  ('�������� ', '�����', '������������', '375292922803', '�������� �������, ����� ���������, ������ �������������, 41', 'jirbold@gmail.com',0),
		  ('����������', '������', '��������', '375257630238', '����������� �������, ����� ����, ��. ����������, 48', 'wyalkxfde@gmail.com',1)

go

insert into ������([ID ������], [���� �������], [���������� ����������� ������], [������� ���������])
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