/*
Drop table if exists t1
Create table t1(
id1 int
)

Insert into t1 values (1)
Insert into t1 values (1)
Insert into t1 values (3)

Drop table if exists t2
Create table t2(
id2 int
)

Insert into t2 values (1)
Insert into t2 values (1)
Insert into t2 values (2)*/

 Select * from t1
 Select * from t2

-- Play around with the type of join

Select *
from t1
full outer join t2 
on t1.id1 = t2.id2

-- Select 2*2(matching) + 1(non) + 1(non)

