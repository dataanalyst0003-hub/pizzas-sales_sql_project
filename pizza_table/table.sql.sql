CREATE TABLE pizza_sales (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(5,2),
    total_price DECIMAL(6,2),
    pizza_size CHAR(2),
    pizza_category VARCHAR(20),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

ALTER TABLE pizza_sales
ALTER COLUMN pizza_size TYPE VARCHAR(5);
