-- Here is the ready script:
/*create table emp_2020
(
emp_id int,
designation varchar(20)
);

create table emp_2021
(
emp_id int,
designation varchar(20)
)

insert into emp_2020 values (1,'Trainee'), (2,'Developer'),(3,'Senior Developer'),(4,'Manager');
insert into emp_2021 values (1,'Developer'), (2,'Developer'),(3,'Manager'),(5,'Trainee');*/

-- SELECT * FROM EMP_2020
-- SELECT * FROM EMP_2021

SELECT ISNULL(E1.EMP_ID, E2.EMP_ID),
CASE WHEN E1.DESIGNATION != E2.DESIGNATION THEN 'PROMOTED'
WHEN E2.DESIGNATION IS NULL THEN 'RESIGNED'
ELSE 'NEW EMPLOYEE' END AS COMMENT
FROM EMP_2020 AS E1
FULL OUTER JOIN
EMP_2021 AS E2
ON E1.EMP_ID = E2.EMP_ID
WHERE ISNULL(E1.DESIGNATION,'XXX') != ISNULL(E2.DESIGNATION,'YYY')

