-- Q6 Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category, sum(order_details.quantity) as total_quantity
from order_details
join pizzas
on order_details.pizza_id=pizzas.pizza_id
join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by pizza_types.category
order by total_quantity 
