-- RANK THE DUPLICATE RECORDS

/*create table list (id varchar(5));
insert into list values ('a');
insert into list values ('a');
insert into list values ('b');
insert into list values ('c');
insert into list values ('c');
insert into list values ('c');
insert into list values ('d');
insert into list values ('d');
insert into list values ('e');*/

-- SELECT * FROM LIST

-- We will only give duplicate ids not for the non dup ones

with CTE_Dups as(
Select id from list 
group by id
having count(1) > 1),
cte_rn as
(Select *, rank() over(order by id) as rn from cte_dups)

Select l1.*, 'dup' + cast(cr.rn as varchar(2)) as output 
from list as l1
left join
cte_rn as cr
on l1.id = cr.id


