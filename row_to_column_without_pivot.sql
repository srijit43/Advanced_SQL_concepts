-- Sum(case..)
-- Rows to columns and vice versa without pivot
-- Drop table if exists salary_adjustment
Create table salary_adjustment(
emp_id int,
salary_component varchar(20),
val int
)

Insert into salary_adjustment values (1,'salary',5000)
Insert into salary_adjustment values (1,'bonus',900)
Insert into salary_adjustment values (1,'hike_percent',10)
Insert into salary_adjustment values (2,'salary',7999)
Insert into salary_adjustment values (2,'bonus',1200)
Insert into salary_adjustment values (2,'hike_percent',9)
Insert into salary_adjustment values (3,'salary',4500)
Insert into salary_adjustment values (3,'bonus',800)
Insert into salary_adjustment values (3,'hike_percent',11)

-- Select * FROM salary_adjustment

-- convert this to emp_id, salary, bonus, hike_percent

Select 
emp_id,
sum(case when salary_component = 'salary' then val end) as salary,
sum(case when salary_component = 'bonus' then val end) as bonus,
sum(case when salary_component = 'hike_percent' then val  end) as hike_percent
from
salary_adjustment
group by emp_id

-- here we need values at emp_id level, so group by emp_id. Now group by wants an aggregate and hence sum(case...)
-- this is an extremely important scenario very important in interviews

-- Now unpivot this

Select emp_id,'salary' as sal_comp, salary as val from emp_compensation_pivot
union all
Select emp_id,'bonus' as sal_comp, bonus as val from emp_compensation_pivot
union all
Select emp_id,'hike_percent' as sal_comp, salary as val from emp_compensation_pivot


-- if you want in an ordered manner

Select * from(
Select emp_id,'salary' as sal_comp, salary as val from emp_compensation_pivot
union all
Select emp_id,'bonus' as sal_comp, bonus as val from emp_compensation_pivot
union all
Select emp_id,'hike_percent' as sal_comp, salary as val from emp_compensation_pivot
)a
order by emp_id
