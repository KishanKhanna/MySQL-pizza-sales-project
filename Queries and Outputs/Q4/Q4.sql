-- Q4 Identify the most common pizza size ordered.
select pizzas.size, sum(order_details.quantity) as total_quantity
from order_details
join pizzas
on order_details.pizza_id=pizzas.pizza_id
group by pizzas.size
order by total_quantity desc
limit 1
