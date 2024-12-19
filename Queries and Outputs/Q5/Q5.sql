-- Q5 List the top 5 most ordered pizza types along with their quantities.
--
select pizza_types.name, sum(order_details.quantity) as total_quantity
from order_details
join pizzas
on order_details.pizza_id=pizzas.pizza_id
join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by pizza_types.name
order by total_quantity desc
limit 5
