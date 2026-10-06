-- Create Pizza Sales View
-- Converts order date into proper DATE format

USE pizza_sales_db;

CREATE VIEW pizza_sales AS
SELECT
    od.pizza_id,
    od.order_id,
    p.pizza_type_id AS pizza_name_id,
    od.quantity,
    STR_TO_DATE(o.date, '%d-%m-%Y') AS order_date,
    o.time AS order_time,
    p.price AS unit_price,
    od.quantity * p.price AS total_price,
    p.size AS pizza_size,
    pt.category AS pizza_category,
    pt.ingredients AS pizza_ingredients,
    pt.name AS pizza_name
FROM orders AS o
JOIN order_details AS od
    ON o.order_id = od.order_id
JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types AS pt
    ON p.pizza_type_id = pt.pizza_type_id;


-- Check the Pizza Sales View

SELECT *
FROM pizza_sales
LIMIT 10;
