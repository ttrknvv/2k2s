
use master;

create database DB_OlympUser_09;

go

use OLYMP2022;

-- ������� ����������� (�����, ���, ������ �� �����, ����� ����������, �����) 
CREATE TABLE emp_09 (
        empno int, 
        ename VARCHAR(15), 
        sal decimal(6,2),
        mgr int,
        deptno int);

INSERT INTO emp_09 VALUES (7839,'KING',5000, null, 10);
INSERT INTO emp_09 VALUES (7698,'BLAKE',2750, 7839, 10);
INSERT INTO emp_09 VALUES (7782,'CLARK',2450, 7839, 10);
INSERT INTO emp_09 VALUES (7566,'JONES',295, 7698, 20);
INSERT INTO emp_09 VALUES (7654,'MARTIN',1250, 7566, 30);
INSERT INTO emp_09 VALUES (7499,'ALLEN',1600, 7566, 20);
INSERT INTO emp_09 VALUES (7844,'TURNER', 1500, 7698, 30);
INSERT INTO emp_09 VALUES (7900,'JAMES', 950, 7839, 20);
INSERT INTO emp_09 VALUES (7521,'WARD', 1250,7844, 20);
INSERT INTO emp_09 VALUES (7902,'FORD',3000, 7521, 10);
INSERT INTO emp_09 VALUES (7369,'SMITH', 700, 7499, 20);
INSERT INTO emp_09 VALUES (7788,'SCOTT', 3000, 7698, 30);
INSERT INTO emp_09 VALUES (7876,'ADAMS',1100, 7788, 30);
INSERT INTO emp_09 VALUES (7934,'MILLER',1300, 7788, 10);
COMMIT;

-- ������� �������������� ������ ����������� (����� ����������, ���� �������, �����)
CREATE TABLE emp_payment_09 (
        empno int,
        payment_date DATE, 
        amount decimal(6,2));

INSERT INTO emp_payment_09 VALUES (7839,'2023-01-01',1000);
INSERT INTO emp_payment_09	 VALUES (7839,'2023-01-03',1000);
INSERT INTO emp_payment_09 VALUES (7839,'2023-02-01',1000);
INSERT INTO emp_payment_09 VALUES (7839,'2023-02-03',1000);
INSERT INTO emp_payment_09 VALUES (7698,'2023-01-01',275);
INSERT INTO emp_payment_09 VALUES (7698,'2023-01-07',275);
INSERT INTO emp_payment_09 VALUES (7698,'2023-02-01',275);
INSERT INTO emp_payment_09 VALUES (7698,'2023-02-07',275);
INSERT INTO emp_payment_09 VALUES (7782,'2023-01-01',245);
INSERT INTO emp_payment_09 VALUES (7782,'2023-01-06',245);
INSERT INTO emp_payment_09 VALUES (7782,'2023-01-09',245);
INSERT INTO emp_payment_09 VALUES (7566,'2023-01-01',295);
INSERT INTO emp_payment_09 VALUES (7566,'2023-01-09',295);
INSERT INTO emp_payment_09 VALUES (7566,'2023-04-01',295);
INSERT INTO emp_payment_09 VALUES (7566,'2023-03-09',295);
INSERT INTO emp_payment_09 VALUES (7654,'2023-01-01',125);
INSERT INTO emp_payment_09 VALUES (7654,'2023-01-02',125);
INSERT INTO emp_payment_09 VALUES (7499,'2023-01-01',160);
INSERT INTO emp_payment_09 VALUES (7844,'2023-01-01', 150);
INSERT INTO emp_payment_09 VALUES (7900,'2023-01-01', 950);
INSERT INTO emp_payment_09 VALUES (7521,'2023-01-01', 125);
INSERT INTO emp_payment_09 VALUES (7902,'2023-01-01',300);
INSERT INTO emp_payment_09 VALUES (7902,'2023-01-02',300);
INSERT INTO emp_payment_09 VALUES (7902,'2023-02-01',300);
INSERT INTO emp_payment_09 VALUES (7902,'2023-02-02',300);
INSERT INTO emp_payment_09 VALUES (7902,'2023-03-01',300);
INSERT INTO emp_payment_09 VALUES (7902,'2023-03-02',300);
INSERT INTO emp_payment_09 VALUES (7369,'2023-01-01', 700);
INSERT INTO emp_payment_09 VALUES (7788,'2023-01-01', 300);
INSERT INTO emp_payment_09 VALUES (7876,'2023-01-01',110);
INSERT INTO emp_payment_09 VALUES (7934,'2023-01-01',130);
COMMIT;


-- ������� ��������� �������
CREATE TABLE bank_09
    (banknote int);

INSERT INTO bank_09 VALUES (100);
INSERT INTO bank_09 VALUES (50);
INSERT INTO bank_09 VALUES (20);
INSERT INTO bank_09 VALUES (10);
INSERT INTO bank_09 VALUES (5);
INSERT INTO bank_09 VALUES (2);
INSERT INTO bank_09 VALUES (1);
COMMIT;

-- ������� ���������� ������ (����� �����������, � ������ ����� �����������, �� ������ ����� �����������)
CREATE TABLE sick_day_09  
            (empno int,   
             date_from date,   
             date_to date);

INSERT INTO sick_day_09 VALUES (7839,'2023-04-01','2023-04-03');
INSERT INTO sick_day_09 VALUES (7839,'2023-04-09','2023-04-11');
INSERT INTO sick_day_09 VALUES (7839,'2023-04-29','2023-05-01');
INSERT INTO sick_day_09 VALUES (7698,'2023-04-05','2023-04-06');
INSERT INTO sick_day_09 VALUES (7698,'2023-04-09','2023-04-10');
INSERT INTO sick_day_09 VALUES (7698,'2023-04-28','2023-05-02');
INSERT INTO sick_day_09 VALUES (7782,'2023-04-07','2023-04-07');
INSERT INTO sick_day_09 VALUES (7782,'2023-04-09','2023-04-09');
INSERT INTO sick_day_09 VALUES (7566,'2023-04-03','2023-04-07');
INSERT INTO sick_day_09 VALUES (7654,'2023-04-09','2023-04-09');
INSERT INTO sick_day_09 VALUES (7499,'2023-04-12','2023-04-17');
INSERT INTO sick_day_09 VALUES (7844,'2023-04-19','2023-04-19');
INSERT INTO sick_day_09 VALUES (7900,'2023-04-13','2023-04-19');
INSERT INTO sick_day_09 VALUES (7521,'2023-04-19','2023-05-09');
COMMIT;
