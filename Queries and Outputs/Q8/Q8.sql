-- Q8 Join relevant tables to find the category-wise distribution of pizzas.
select category, count(pizza_type_id) from pizza_types
group by category