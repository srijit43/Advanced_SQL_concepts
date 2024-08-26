-- Cross join

/*create table products (
id int,
name varchar(10)
);
insert into products VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

create table colors (
color_id int,
color varchar(50)
);
insert into colors values (1,'Blue'),(2,'Green'),(3,'Orange');

create table sizes
(
size_id int,
size varchar(10)
);

insert into sizes values (1,'M'),(2,'L'),(3,'XL');

create table transactions
(
order_id int,
product_name varchar(20),
color varchar(10),
size varchar(10),
amount int
);
insert into transactions values (1,'A','Blue','L',300),(2,'B','Blue','XL',150),(3,'B','Green','L',250),(4,'C','Blue','L',250),
(5,'E','Green','L',270),(6,'D','Orange','L',200),(7,'D','Green','M',250);
*/

/*Select p.*, c.*
from
products p,
colors c*/

-- Select * from products
-- Select * from colors

-- use case

Select * from transactions

-- give me the sales for each product color and size

select product_name, color, size, sum(amount) as amt
from transactions 
group by product_name, color, size


with master_table as(
Select p.*,c.color, s.size 
from
products p, colors c, sizes s),

sales as
(
select product_name, color, size, sum(amount) as amt
from transactions 
group by product_name, color, size
)

Select mt.name, mt.color,mt.size, isnull(s.amt,0) as total_amount
from 
master_table as mt
left join
sales as s
on mt.color = s.color
and mt.size = s.size
and mt.name = s.product_name
order by 
isnull(s.amt,0) desc

-- Prepare some performance testing data

-- Select * from transactions







