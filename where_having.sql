Create table Employees(
ID int,
name varchar(50),
dept_id int,
salary int,
manager_id int
)

Insert into Employees values (1,'Srijit',100,4000,2)
Insert into Employees values (2,'Rounak',100,5000,null)
Insert into Employees values (3,'Parna',100,3500,2)
Insert into Employees values (4,'Soumyajit',200,4200,5)
Insert into Employees values (5,'Anisha',200,4500,2)

Select * from Employees


Select * from Employees where salary > 4000  -- where clause checks every row

-- having is used when we apply filter on aggregated column

Select dept_id, avg(salary) as avg_sal
from 
Employees
group by dept_id
having avg(salary) > 4200

-- first groups and then checks

-- where applied to each row, having applied to filtered rows
-- in a query where both are used where is executed before having







