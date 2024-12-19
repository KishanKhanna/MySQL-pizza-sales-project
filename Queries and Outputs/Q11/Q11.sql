-- Q11 Calculate the percentage contribution of each pizza category total revenue.
WITH total_revenue AS (
    SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
    FROM order_details
    JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
),
revenue_by_category AS (
    SELECT 
        pizza_types.category AS pizza_type_category,
        ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue
    FROM order_details
    JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
    JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    GROUP BY pizza_types.category
)
SELECT 
    revenue_by_category.pizza_type_category,
    ROUND((revenue_by_category.revenue / total_revenue.total_revenue) * 100, 2) AS revenue_percentage
FROM revenue_by_category, total_revenue
ORDER BY revenue_percentage DESC;
