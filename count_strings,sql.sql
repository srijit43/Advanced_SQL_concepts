-- Difference between count types
Select * from employee_ab

Select count(*) from employee_ab

Select count(*),count(1), count(dept_id), count(distinct(dept_id)) from employee_ab
-- count(col_name) does not return null values but count(1/*/0/100) all return null value rows as well

-- Count number of occurences in a string

/*
Create table character_ab
(name varchar(30))

Insert into character_ab values ('Ankit Bansal')
Insert into character_ab values ('Ashok Ram Niwas')
Insert into character_ab values ('Ankan Majumdar')
*/

Select * from character_ab


Select name,
replace(name,' ','') as rep_name
from character_ab


Select name,
replace(name,' ','') as rep_name,
len(name) - len(replace(name,' ','')) as count
from character_ab


Select name,
replace(name,'Ank','') as rep_name,
(len(name) - len(replace(name,'Ank','')))/len('Ank') as count
from character_ab



