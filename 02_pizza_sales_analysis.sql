-- =========================================
-- Pizza Sales Analysis
-- =========================================

USE pizza_sales_db;

-- 1. Total Revenue
-- Finds the total money earned from all pizza sales

SELECT
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales;


-- 2. Average Order Value
-- Finds the average amount spent per order

SELECT
    ROUND(
        SUM(total_price) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM pizza_sales;


-- 3. Total Pizzas Sold
-- Finds the total number of pizzas sold

SELECT
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;


-- 4. Total Orders
-- Counts the number of unique orders

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;


-- 5. Average Pizzas Per Order
-- Finds the average number of pizzas in each order

SELECT
    ROUND(
        SUM(quantity) / COUNT(DISTINCT order_id),
        2
    ) AS avg_pizzas_per_order
FROM pizza_sales;


-- 6. Daily Orders
-- Shows how many orders were placed each day

SELECT
    order_date,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;


-- 7. Monthly Orders
-- Shows how many orders were placed in each month

SELECT
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY month_number;


-- 8. Sales by Pizza Category
-- Shows the percentage of total sales from each category

SELECT
    pizza_category,
    ROUND(
        SUM(total_price) /
        (SELECT SUM(total_price) FROM pizza_sales) * 100,
        2
    ) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_category
ORDER BY sales_percentage DESC;


-- 9. Sales by Pizza Size
-- Shows the percentage of total sales from each pizza size

SELECT
    pizza_size,
    ROUND(
        SUM(total_price) /
        (SELECT SUM(total_price) FROM pizza_sales) * 100,
        2
    ) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY sales_percentage DESC;


-- 10. Pizzas Sold by Category
-- Shows the total number of pizzas sold in each category

SELECT
    pizza_category,
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;


-- 11. Top 5 Pizzas by Revenue
-- Finds the five pizzas that generated the highest revenue

SELECT
    pizza_name,
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;


-- 12. Bottom 5 Pizzas by Revenue
-- Finds the five pizzas that generated the lowest revenue

SELECT
    pizza_name,
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;


-- 13. Top 5 Pizzas by Quantity
-- Finds the five pizzas sold in the highest quantities

SELECT
    pizza_name,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;


-- 14. Bottom 5 Pizzas by Quantity
-- Finds the five pizzas sold in the lowest quantities

SELECT
    pizza_name,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;


-- 15. Top 5 Pizzas by Orders
-- Finds the five pizzas included in the most orders

SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;


-- 16. Bottom 5 Pizzas by Orders
-- Finds the five pizzas included in the fewest orders

SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;