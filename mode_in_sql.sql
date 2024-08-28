-- Calculate Mode in SQL


/*create table mode 
(
id int
);

insert into mode values (1),(2),(2),(3),(3),(3),(3),(4),(5);*/

-- Select * from mode

-- Calculating mode using CTE
with freq_cte as(
Select id, count(*) as freq
from mode
group by id)

Select id, freq from freq_cte
where freq = (select max(freq) from freq_cte)

-- Using rank func

with freq_cte as
(
Select id, count(*) as freq
from mode
group by id),

rank_cte as(
Select id,freq, 
rank() over(order by freq desc) as rn from freq_cte)

Select id, freq from rank_cte
where rn = 1




/*Select m1.id, count(m2.id) as freq
from
mode as m1
inner join
mode as m2
on m1.id = m2.id
group by m1.id*/

