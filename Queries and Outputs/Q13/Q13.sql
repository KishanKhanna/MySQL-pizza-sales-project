-- Q13 Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT 
    rbt1.category,
    rbt1.pizza_type_name,
    rbt1.revenue
FROM (
    SELECT 
        pizza_types.category,
        pizza_types.name AS pizza_type_name,
        ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue
    FROM order_details
    JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
    JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    GROUP BY pizza_types.category, pizza_types.name
) AS rbt1
WHERE (
    SELECT COUNT(*) 
    FROM (
        SELECT 
            pizza_types.category,
            pizza_types.name AS pizza_type_name,
            ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue
        FROM order_details
        JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
        JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        GROUP BY pizza_types.category, pizza_types.name
    ) AS rbt2
    WHERE rbt2.category = rbt1.category AND rbt2.revenue > rbt1.revenue
) < 3
ORDER BY rbt1.category, rbt1.revenue DESC;
