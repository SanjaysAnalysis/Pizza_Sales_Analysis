select * from pizza_sales

select round(sum(total_price),2) as Total_revenue
from pizza_sales	--817860.05

select round(sum(total_price)/count(distinct order_id),2) as Avg_Order_Value 
from pizza_sales	--38.31

select sum(quantity) as Total_pizza_sold
from pizza_sales	--49574

select count(distinct order_id) 
from pizza_sales	--21350

select round(sum(quantity)/count(distinct order_id),2) as Avg_pizza_per_Order
from pizza_sales	--2.32

--Charts

-- weekly trend

select datename(dw,order_date) as order_day, count(distinct(order_id)) as Total_orders
from pizza_sales
group by datename(dw,order_date)

-- monthly trend

select datename(month, order_date) as order_month, count(distinct(order_id)) as total_orders
from pizza_sales
group by datename(month, order_date)

-- % of sales by pizza category

select pizza_category, round(sum(total_price),2) as Total_cost, round((sum(total_price)/(select sum(total_price) from pizza_sales) * 100),2) as perc_of_total_cost
from pizza_sales
group by pizza_category
order by sum(total_price) desc

-- % of sales by pizza size

select pizza_size, round(sum(total_price),2) as Total_cost, round(sum(total_price)/(select sum(total_price) from pizza_sales) * 100,2) as perc_of_total_cost
from pizza_sales
group by pizza_size
order by sum(total_price) desc

-- pizza sold by pizza category

select pizza_category, sum(quantity) as Quantity
from pizza_sales
group by pizza_category
order by sum(quantity) desc

-- top 5 pizzas by revenue

select top 5 pizza_name, round(sum(total_price),2) as total_revenue
from pizza_sales
group by pizza_name
order by sum(total_price) desc

-- bottom 5 pizzas by revenue

select top 5 pizza_name, round(sum(total_price),2) as total_revenue
from pizza_sales
group by pizza_name
order by sum(total_price)

-- top 5 pizzas by quantity

select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by sum(quantity) desc

-- bottom 5 by quantity

select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by  sum(quantity)

-- top 5 by orders

select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

-- bottom 5 by orders

select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders

