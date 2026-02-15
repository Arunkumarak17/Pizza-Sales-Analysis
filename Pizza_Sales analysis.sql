create database Pizza_DB

use Pizza_DB

select * from pizza_sales

-- 1. Total Reveneue:

select sum(total_price) as Total_Sales
from pizza_sales

-- 2. Average Order Value:

select SUM(total_price)/COUNT(distinct order_id) as Avg_order_value
from pizza_sales

-- 3. Total Pizzas Sold

 select SUM(quantity) as Total_Pizzas_Sold
 from pizza_sales

-- 4. Total orders

select count(distinct order_id) as Total_Orders
from pizza_sales

-- 5. Average pizzs per order

select cast(cast(SUM(quantity) as decimal(10,2))/
cast(COUNT(distinct order_id) as decimal (10,2)) as decimal(10,2)) as Avg_pizzas_per_order
from pizza_sales


-- Chart requirement

-- 1. Daily trend for total orders

select DATENAME(dw,order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(dw,order_date)

-- 2. Monthly trend for total orders

select DATENAME(month,order_date) as month_name, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(month,order_date)

-- 3. Percentage of sales pizza category

select pizza_category, sum(total_price) as Total_sales, sum(total_price)*100/(select SUM(total_price)
from pizza_sales) as Per_of_sales
from pizza_sales
group by pizza_category

-- 4. Percentage of sales pizza size

select pizza_size, sum(total_price) as Total_sales, cast(sum(total_price)*100/(select SUM(total_price)
from pizza_sales) as decimal(10,2)) as Per_of_sales
from pizza_sales
group by pizza_size


-- 5. Total sales sold by pizza category

select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_price_sold
from pizza_sales
group by pizza_category

-- 6.1 Top 5 pizzas sold by revenue

select top 5 pizza_name, SUM(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue desc

-- 6.2 Top 5 pizzas sold by total quantity

select top 5 pizza_name, SUM(quantity) as Total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity desc

-- 6.3 Top 5 pizzas sold by total orders

select top 5 pizza_name, count(distinct order_id) as Total_order
from pizza_sales
group by pizza_name
order by Total_order desc

-- 7.1 Bottom 5 pizzas sold by revenue

select top 5 pizza_name, SUM(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue asc

-- 7.2 Bottom 5 pizzas sold by total quantity

select top 5 pizza_name, SUM(quantity) as Total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity asc

-- 7.2 Bottom 5 pizzas sold by total orders

select top 5 pizza_name, count(distinct order_id) as Total_order
from pizza_sales
group by pizza_name
order by Total_order asc