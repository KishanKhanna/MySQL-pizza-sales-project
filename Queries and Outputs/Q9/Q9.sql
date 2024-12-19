-- Q9 Group the orders by date and calculate the average number of pizzas ordered per day.
with daily_table as(
select date(orders.order_date), sum(order_details.quantity) as daily_quantity, count(orders.order_id)as daily_orders
from orders
join order_details on orders.order_id=order_details.order_id 
group by date(orders.order_date)
)
select round(avg(daily_quantity),0) as average_daily_quantity from daily_table 
