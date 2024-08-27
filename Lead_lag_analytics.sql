-- Lag is previous, lead is next

-- Select * from superstore_orders
-- Lag

With year_sales as
(
Select DATEPART(year,Order_Date) as year, round(sum(sales),2) as total_sales_by_year
from superstore_orders
group by DATEPART(year,Order_Date)
-- order by DATEPART(year,Order_Date) 
)

Select year, total_sales_by_year,
lag(total_sales_by_year,1,0) over (order by year) as prev_year_sales,
total_sales_by_year - lag(total_sales_by_year,1,0) over (order by year) as diff_sales
from year_sales
order by year

-- Lead

With year_sales as
(
Select DATEPART(year,Order_Date) as year, round(sum(sales),2) as total_sales_by_year
from superstore_orders
group by DATEPART(year,Order_Date)
-- order by DATEPART(year,Order_Date) 
)

Select year, total_sales_by_year,
lead(total_sales_by_year,1,0) over (order by year) as prev_year_sales,
total_sales_by_year - lead(total_sales_by_year,1,0) over (order by year) as diff_sales
from year_sales
order by year



-- We need not use both lead and lag, we can use order by differently as well


With year_sales as
(
Select DATEPART(year,Order_Date) as year, round(sum(sales),2) as total_sales_by_year
from superstore_orders
group by DATEPART(year,Order_Date)
-- order by DATEPART(year,Order_Date) 
)

Select year, total_sales_by_year,
lag(total_sales_by_year,1,0) over (order by year desc) as prev_year_sales
-- total_sales_by_year - lag(total_sales_by_year,1,0) over (order by year) as diff_sales
from year_sales
order by year


-- making a bit more complicated

With year_sales as
(
Select region,DATEPART(year,Order_Date) as year, round(sum(sales),2) as total_sales_by_year
from superstore_orders
group by region,DATEPART(year,Order_Date)
-- order by DATEPART(year,Order_Date) 
)

Select region,year, total_sales_by_year,
lag(total_sales_by_year,1,0) over (partition by region order by year ) as prev_year_sales
-- total_sales_by_year - lag(total_sales_by_year,1,0) over (order by year) as diff_sales
from year_sales
order by year



