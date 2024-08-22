-- Self join concept ( very important for interviews )


/*create table emp_manager(emp_id int,emp_name varchar(50),salary int,manager_id int);

insert into emp_manager values(	1	,'Srijit',	10000	,4	);
insert into emp_manager values(	2	,'Rounak',	15000	,5	);
insert into emp_manager values(	3	,'Parna',	10000	,4	);
insert into emp_manager values(	4	,'Soumyajit',	5000	,2	);
insert into emp_manager values(	5	,'Anisha',	12000	,6	);
insert into emp_manager values(	6	,'Aritra',	12000	,2	);
insert into emp_manager values(	7	,'Alolika',	9000	,2	);
insert into emp_manager values(	8	,'Trisha',	5000	,2	);*/

-- Select * from emp_manager

-- Find employee salary more than their managers

Select e.emp_id, e.emp_name, m.emp_name as manager, e.salary, m.salary as manager_sal
from emp_manager as e
inner join
emp_manager as m
on e.manager_id = m.emp_id
where m.salary < e.salary