use chinnu ;
-- select * from department1008
-- select * from employee1008;
-- 1
-- select emp_name from employee1008 where dept_no=(select dept_no from department1008 where dept_name='HR') 
-- 2
-- select emp_name  from employee1008 where salary>(select salary from employee1008 where emp_no=151)
-- 3
-- select emp_name from employee1008 where salary>=(select avg(salary) from employee1008 where dept_no='d05')
-- 4
-- select emp_name from employee1008 where salary=(select max(salary) from employee1008)
-- 5
-- select emp_name, salary from employee1008 where salary between 20000 and 55000;
-- 6- no output beacause we cant update 
-- update employee1008 set salary=salary*0.25 where 
-- dept_no=(select dept_no from department1008 where dept_name='marketing')
-- 7.
-- select dept_name from department1008 where dept_no =
--  (select dept_no from employee1008 where salary= (select min(salary) from employee1008))
-- 8
-- select * from employee1008 where salary>(select salary from employee1008 where emp_name='Imam') and 
-- dept_no=(select dept_no from employee1008 where emp_name='John')


-- 9
-- select emp_name from employee1008 where salary<(select avg(salary) 
-- from employee1008 where dept_no=(select dept_no from department1008 where dept_name='HR'))
-- 10
select count(*) from employee1008 where dept_no=(select dept_no from employee1008 where emp_name='John')