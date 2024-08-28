-- How to calculate median in SQl two methods

-- Select * from emp
/*create table emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp
values
(1, 'Ankit', 100,10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000,4,37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',300,7000,6,50);*/

-- Select * from emp

-- median is sort and find the middle number, if odd. if even it is add the two middle numbers and divide by 2 (basic math)

-- odd
With cte_rn as(
Select *,
ROW_NUMBER() over(order by emp_age asc) as rn_asc,
ROW_NUMBER() over(order by emp_age desc) as rn_desc
from
emp
where emp_id < 10)
-- order by emp_age)

Select emp_age from cte_rn 
where rn_asc  - rn_desc  = 0

-- Even

With cte_rn as(
Select *,
ROW_NUMBER() over(order by emp_age asc) as rn_asc,
ROW_NUMBER() over(order by emp_age desc) as rn_desc
from
emp
)
-- order by emp_age)

Select emp_age from cte_rn 
where abs(rn_asc  - rn_desc)  <= 1


-- Method 2 is where we use percentile

Select *,
PERCENTILE_CONT(0.5) within group (order by emp_age) over(partition by department_id) as median_by_dept
from
emp
where emp_id < 10





