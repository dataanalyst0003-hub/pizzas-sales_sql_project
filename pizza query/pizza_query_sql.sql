-- 1
SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;


-- 2
SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;

-- 3
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;

-- 4
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

-- 5
SELECT 
    ROUND(SUM(quantity)::DECIMAL / COUNT(DISTINCT order_id), 2) 
    AS avg_pizzas_per_order
FROM pizza_sales;


-- 6

SELECT 
    TRIM(TO_CHAR(order_date, 'Day')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 
    TRIM(TO_CHAR(order_date, 'Day')),
    EXTRACT(DOW FROM order_date)
ORDER BY EXTRACT(DOW FROM order_date);


-- 7

SELECT 
    TRIM(TO_CHAR(order_date, 'Month')) AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 
    TRIM(TO_CHAR(order_date, 'Month')),
    EXTRACT(MONTH FROM order_date)
ORDER BY EXTRACT(MONTH FROM order_date);



-- 8

SELECT 
    pizza_category,
    ROUND(SUM(total_price),2) AS total_revenue,
    ROUND(
        SUM(total_price) * 100.0 / 
        (SELECT SUM(total_price) FROM pizza_sales)
    ,2) AS pct
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pct DESC;


-- 9
SELECT 
    pizza_size,
    ROUND(SUM(total_price),2) AS total_revenue,
    ROUND(
        SUM(total_price) * 100.0 / 
        (SELECT SUM(total_price) FROM pizza_sales)
    ,2) AS pct
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct DESC;

-- 10
SELECT 
    pizza_category, 
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
WHERE EXTRACT(MONTH FROM order_date) = 2
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;


-- 11
SELECT 
    pizza_name, 
    SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;


-- 12
SELECT 
    pizza_name, 
    SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;


-- 13
SELECT 
    pizza_name, 
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC
LIMIT 5;





