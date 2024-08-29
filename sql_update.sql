-- sql update
-- update syntax for single value update
-- update with where caluse
-- update multiple values
-- update col with constant values
-- update using join
-- interview question
-- cautious before running update

-- update affects the row 

-- Select * from emp
-- update syntax for single value update
update emp
set salary = 12000
where emp_id = 1

-- update multiple values
update emp
set salary = 16000, department_id = 200
where emp_id = 2

-- update col with constant values
update emp set salary = salary + 500 

-- update based on join

/*Create table dept(
department_id int,
dept_name varchar(20)
)

Insert into dept values (100,'IT')
Insert into dept values (200,'Sales')
Insert into dept values (300,'HR')*/

-- Select * from dept

/*alter table emp
add dept_name varchar(20)
*/
-- Select * from emp

update emp
set dept_name = d.dept_name
from emp e
inner join 
dept d
on e.department_id = d.department_id

-- Using update and case when then

/*alter table emp
add gender varchar(10)*/

update emp
set gender = case when department_id = 100 then 'Male' else 'Female' end

-- How do we swap the gender (very very interesting and important question)

update emp
set gender = case when gender = 'Male' then 'Female' else 'Male' end


-- cautions before update statement

-- run select instead of update

select  *
,gender = case when gender = 'Male' then 'Female' else 'Male' end 
from emp




