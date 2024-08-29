-- Rolling sum

/*Create table prod1(
id int,
pname varchar(10),
cost int,
)

Insert into prod1 values (1,'P1',200)
Insert into prod1 values (2,'P2',300)
Insert into prod1 values (3,'P3',300)
Insert into prod1 values (4,'P4',500)
Insert into prod1 values (5,'P5',600)*/

-- Select * from prod1

Select *,
sum(cost) over(order by cost) as running_cost
from prod1
-- since there is a product with same cost hence the running total is 800 twice

Select *,
sum(cost) over(order by cost, id) as running_cost
from prod1

-- rows between 
Select *,
sum(cost) over(order by cost rows between unbounded preceding and current row) as running_cost
from prod1