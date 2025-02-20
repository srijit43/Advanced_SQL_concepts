-- find companies who have atleast 2 users who speaks English and German 

/*create table company_users_google 
(
company_id int,
user_id int,
language varchar(20)
);

insert into company_users_google values (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English');*/

Select * from company_users_google

select company_id from (
select company_id, user_id, count(distinct(language)) as germ_eng
from
company_users_google
where language in ('German','English')
group by user_id, company_id
having(count(distinct(language))) = 2) a
group by company_id
having count(1) > 1