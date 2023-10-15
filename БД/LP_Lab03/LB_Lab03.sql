use master
create database T_MyBase2
on primary
(name = N'T_MyBase_mdf', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_mdf.mdf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_ndf', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_ndf.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%),
filegroup FG1
(name = N'T_MyBase_fg1_1', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_fg1_1.ndf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_fg1_2', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_fg1_2.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%),
filegroup FG2	
(name = N'T_MyBase_fg2_1', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_fg2_1.ndf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_fg2_2', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_fg2_2.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%),
filegroup FG3	
(name = N'T_MyBase_fg3_1', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_fg3_1.ndf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'T_MyBase_fg3_2', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_fg3_2.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%)
log on
(name = N'T_MyBase_log', filename = N'D:\2k2s\��\LP_Lab03\T_MyBase_log.ldf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 10%)

go

use T_MyBase2;
CREATE table ������ /* �������� ������� �� ��������� */
(	��������_������ nvarchar(50) not null, /* �� ��������� null */
	���� real not null,
	����������_��_������ int not null,
	id_������ int primary key not null /* ��������� ���� */
) on FG1;

go

CREATE table �������
(
	�������_������� nvarchar(30) not null,
	��� nvarchar(30) not null,
	�������� nvarchar(30) not null,
	����� nvarchar(30) not null,
	������� nchar(12) primary key not null,
	Email nchar(30) not null
) on FG2;

go

CREATE table ������
(	�����_������ int primary key not null,
	id_������ int not null foreign key references ������(id_������), /* ������� ���� */
	����_�����������_������ real not null,
	����������_�����������_������ int not null,
	����_������� date not null,
	�������_��������� nchar(12) not null foreign key references �������(�������)
) on FG3;

ALTER table ������ ADD ����_����������� date; /* ������� ���������� */

ALTER table ������� ADD ��� nchar(1) not null, /* ���������� � ������������� */
CONSTRAINT DF_�������_���1 default '�' FOR ���, 
CONSTRAINT DF_�������_���2 check (��� in ('�', '�'));

ALTER table ������ DROP Column ����_�����������; /* ������� �������� */

ALTER table ������� DROP CONSTRAINT DF_�������_���1; /* �������� ����������� */
ALTER table ������� DROP CONSTRAINT DF_�������_���2;
ALTER table ������� DROP Column ���;

INSERT into ������(id_������,����������_��_������,��������_������,����) /* ������� ������ � ������� */
	Values(1, 200, '�������', 100),
		  (2, 300, '�������', 2000),
		  (3, 180, '�����������', 1000),
		  (5, 50, 'IPHONE 1', 680),
		  (6, 50, 'IPHONE 3', 680),
		  (7, 50, 'IPHONE 10', 680),
		  (8, 50, 'IPHONE 4', 680),
		  (9, 50, 'IPHONE 5', 680);

INSERT into �������(�������_�������, ���, ��������, �������, Email, �����)
	Values('���������', '������', '���������', '375257411803', 'chernaya@gmail.com', 'Belarus'),
		  ('�������', '�����', '���������', '375298795643', 'belaya@gmail.com', 'Russia'),
		  ('���������', '�������', '��������', '375440982389', 'tushkanchik222@gmail.com', 'Moldovia');

INSERT into ������(id_������,����_�������,����������_�����������_������,�����_������,�������_���������,����_�����������_������)
	Values(1, '07.02.2023', 1, 1,375257411803,100),
		  (4, '20.03.2023', 2, 2, 375440982389,680);

SELECT id_������, ����_������� /* ������� ����� */
FROM ������

SELECT id_������, ��������_������ [�������_������] /* ����� � �������� � ����������� */
FROM ������
WHERE ���� < 1000

SELECT count(*)[����������_�����] /* ����� ���������� ����� */
FROM ������

UPDATE ������ set ���� = ���� + 100 WHERE ���� < 1000 /* ��������� �������� � ������� */

SELECT * FROM ������

DELETE FROM ������ Where ���� = 1000 /* �������� ������ */

SELECT * FROM ������

SELECT * FROM ������ /* �������� IN */
WHERE id_������ IN (1, 4)

SELECT * FROM ������ /* �������� NOT */
WHERE id_������ NOT IN (1, 4)

SELECT * FROM ������ /* BETWEEN */
WHERE ����������_��_������ BETWEEN 40 AND 210

SELECT * FROM ������ /* LIKE */
WHERE ��������_������ LIKE 'IPHONE [1-5]'


