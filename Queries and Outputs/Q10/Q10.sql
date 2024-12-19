-- Q10 Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name, ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS revenue
            from order_details
            join pizzas
            on order_details.pizza_id=pizzas.pizza_id
            join pizza_types
            on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by pizza_types.name
order by revenue desc
limit 3