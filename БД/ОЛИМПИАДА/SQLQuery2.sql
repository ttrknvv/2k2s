
select * from emp_09;

---- 6 задание complited

select top 1 deptno, cast(
					(cast((
						cast((select count(*) from emp_09 ee where ee.sal > 1500 and ee.deptno = e.deptno) as float)
							/ cast(
								(select count(*) from emp_09 et where et.deptno = e.deptno) as float)) as float)
									* 100.0) as float) [PC_PERCENT]
	from emp_09 e 
		where (select count(*) from emp_09 es where e.deptno = es.deptno) >= 3
			group by e.deptno 
				order by [PC_PERCENT] desc


select * from emp_payment_09

--- 7 задание

select e.empno, 
	(select sum(es.amount) from (select top 3 * from emp_payment_09 et where et.empno = e.empno order by et.amount desc) es) [MAX_3_AMOUNT]
	from emp_payment_09 e 
		where (select count(*) from emp_payment_09 es where es.empno = e.empno) >= 3
			group by e.empno

-- 1 задание complited


select e.empno, e.ename, 
case
	when e.mgr is null then 'Root'
	when e.mgr is not null and (select count(*) from emp_09 ee where e.empno = ee.mgr) > 0 then 'Inner'
	else 'Leaf'
	end [NODE_POSITION]
	from emp_09 e

---- 2 задание complited

select * from emp_09

select 
case	
	when (select count(*) from emp_09 ee where ee.sal like '%0%') = 0 then '0'
	when (select count(*) from emp_09 ee where ee.sal like '%1%') = 0 then '1'
	when (select count(*) from emp_09 ee where ee.sal like '%2%') = 0 then '2'
	when (select count(*) from emp_09 ee where ee.sal like '%3%') = 0 then '3'
	when (select count(*) from emp_09 ee where ee.sal like '%4%') = 0 then '4'
	when (select count(*) from emp_09 ee where ee.sal like '%5%') = 0 then '5'
	when (select count(*) from emp_09 ee where ee.sal like '%6%') = 0 then '6'
	when (select count(*) from emp_09 ee where ee.sal like '%7%') = 0 then '7'
	when (select count(*) from emp_09 ee where ee.sal like '%8%') = 0 then '8'
	when (select count(*) from emp_09 ee where ee.sal like '%9%') = 0 then '9'
	end [RESULT]
			

--- 3 задание complited

select * from emp_payment_09 where empno = 7698 or empno = 7839 or empno  = 7902

select e.empno
	from emp_payment_09 e
		where exists (select *
			from emp_payment_09 ee 
				where MONTH(e.payment_date) != MONTH(ee.payment_date) 
				and e.empno = ee.empno
				and (select count(*) 
						from emp_payment_09 et 
							where MONTH(et.payment_date) = MONTH(ee.payment_date) 
							and et.empno = ee.empno) >= 2
				and (select count(*) 
						from emp_payment_09 et 
							where MONTH(et.payment_date) = MONTH(e.payment_date) 
							and et.empno = ee.empno) >= 2)
			group by e.empno
	
--- 4 задание coplited

select *
	from emp_payment_09 e where e.empno = 7654

select e.empno, (select max(ee.payment_date) 
					from emp_payment_09 ee where e.empno = ee.empno and MONTH(e.payment_date) = MONTH(ee.payment_date)) [GLORY_DATE]
		from emp_payment_09 e 
			where (select count(*) 
						from emp_payment_09 ee 
							where e.empno = ee.empno and MONTH(e.payment_date) = MONTH(ee.payment_date)) >= 2
					and (select max(et.payment_date) from emp_payment_09 et where MONTH(et.payment_date) = MONTH(e.payment_date) and 
					e.empno = et.empno) = e.payment_date
			GROUP  BY e.payment_date, e.empno
				order by e.empno

select * from emp_09
select * from sick_day_09

select *
	from emp_09 e

	--- 5 задание

select * from emp_payment_09 e  where e.empno = 7521

select e.empno, (select sum(es.amount) from emp_payment_09 es where e.empno = es.empno)[FIRST_AMOUNT], 
ee.empno, (select sum(es.amount) from emp_payment_09 es where ee.empno = es.empno)[SECOND_AMOUNT],
(abs((select sum(es.amount) from emp_payment_09 es where e.empno = es.empno) - 
			(select sum(es.amount) from emp_payment_09 es where ee.empno = es.empno)))[AMOUNT_DIFF]
	from emp_payment_09 e inner join emp_payment_09 ee
		on e.empno != ee.empno
			where abs((select sum(es.amount) from emp_payment_09 es where e.empno = es.empno) - 
			(select sum(es.amount) from emp_payment_09 es where ee.empno = es.empno)) < 10

--- 8 задание


select *
from emp_payment_09 e

select (select max((select top 3 AMOUNT from emp_payment_09 ee where e.empno = ee.empno)) from emp_payment_09 e)
from emp_payment_09 e

select day(MONTH(getdate()))

          






