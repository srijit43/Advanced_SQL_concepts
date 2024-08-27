-- Rank , Dense Rank, Row numer



/*create table employee_ab(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int
);
insert into employee_ab values(1,'Ankit',100,10000);
insert into employee_ab values(2,'Mohit',100,15000);
insert into employee_ab values(3,'Vikas',100,10000);
insert into employee_ab values(4,'Rohit',100,5000);
insert into employee_ab values(5,'Mudit',200,12000);
insert into employee_ab values(6,'Agam',200,12000);
insert into employee_ab values(7,'Sanjay',200,9000);
insert into employee_ab values(8,'Ashish',200,5000);*/



-- window functions

Select *,
rank() over(order by salary desc) as rnk,
dense_rank() over(order by salary desc) as dns_rnk,
ROW_NUMBER() over(order by salary desc) as rn
from employee_ab


-- partition by department ( how do we bring department into the fray)

Select *,
rank() over(partition by dept_id order by salary desc) as rnk,
dense_rank() over(partition by dept_id order by salary desc) as dns_rnk,
ROW_NUMBER() over(partition by dept_id order by salary desc) as rn
from employee_ab

-- department wise highest salary kind of question
-- also a good chance of showing you know CTE
-- nth highest salary by department

with cte_rank as(
Select *,
rank() over(partition by dept_id order by salary desc) as rnk
from employee_ab
)

Select * from cte_rank where rnk = 1






