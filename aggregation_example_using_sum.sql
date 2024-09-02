-- SQL Aggregation. sum(), avg(), min(), max()

/*CREATE TABLE [dbo].[int_orders](
 [order_number] [int] NOT NULL,
 [order_date] [date] NOT NULL,
 [cust_id] [int] NOT NULL,
 [salesperson_id] [int] NOT NULL,
 [amount] [float] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (30, CAST(N'1995-07-14' AS Date), 9, 1, 460)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (10, CAST(N'1996-08-02' AS Date), 4, 2, 540)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (40, CAST(N'1998-01-29' AS Date), 7, 2, 2400)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (50, CAST(N'1998-02-03' AS Date), 6, 7, 600)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (60, CAST(N'1998-03-02' AS Date), 6, 7, 720)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (70, CAST(N'1998-05-06' AS Date), 9, 7, 150)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (20, CAST(N'1999-01-30' AS Date), 4, 8, 1800)*/

Select salesperson_id,order_number,order_date,amount from [dbo].[int_orders]

Select
salesperson_id,
count(distinct(order_number)) as number_of_orders,
sum(amount) as total_sales
from
[dbo].[int_orders]
group by salesperson_id

-- value if not aggregated needs to be in group by or else error will be thrown

-- windowing

Select salesperson_id,order_number,order_date,amount
,sum(amount) over()
from [dbo].[int_orders]


Select salesperson_id,order_number,order_date,amount,
sum(amount) over(order by order_date)
from [dbo].[int_orders] -- it has become a running sum

Select salesperson_id,order_number,order_date,amount,
sum(amount) over(partition by salesperson_id)
from [dbo].[int_orders] -- running sum 


Select salesperson_id,order_number,order_date,amount,
sum(amount) over(partition by salesperson_id order by order_date)
from [dbo].[int_orders] -- running sum partitioned by salesperson



Select salesperson_id,order_number,order_date,amount,
sum(amount) over(order by order_date rows between 2 preceding  and current row)
from [dbo].[int_orders] -- sum of previous 2 rows and current row

Select salesperson_id,order_number,order_date,amount,
sum(amount) over(order by order_date rows between current row and 1 following)
from [dbo].[int_orders] -- current and 1 next

Select salesperson_id,order_number,order_date,amount,
sum(amount) over(order by order_date rows between unbounded preceding and current row)
from [dbo].[int_orders] -- all preceding and current

-- the difference between running sum and unbounded preceding
-- The main difference between unbounded preceding and running sum is that unbounded preceding is a windowing function that specifies the starting point 
-- of a window, while running sum is a cumulative sum that tracks the ongoing total of a series of values













