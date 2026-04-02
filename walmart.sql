SELECT * FROM Walmart_clean

SELECT COUNT(*) AS total_orders
FROM Walmart_clean;


SELECT 
    COUNT(*) AS total_orders,
    SUM(unit_price) AS total_revenue,
    AVG(unit_price) AS avg_order_value
FROM Walmart_clean;

SELECT store_location,
    SUM(quantity_sold * unit_price) AS total_revenue,
    COUNT(*) AS total_orders,
    AVG(quantity_sold * unit_price) AS avg_order_value
FROM Walmart_clean
GROUP BY store_location
ORDER BY total_revenue DESC;

SELECT category,
    SUM(quantity_sold * unit_price) AS revenue
FROM Walmart_clean
GROUP BY category
ORDER BY revenue DESC;

SELECT COUNT(DISTINCT customer_id) FROM Walmart_clean;


SELECT 
    DATEPART(HOUR, transaction_date) AS hour,
    COUNT(*) AS orders
FROM Walmart_clean
GROUP BY DATEPART(HOUR, transaction_date)
ORDER BY orders DESC;

SELECT 
    DATENAME(WEEKDAY, transaction_date) AS weekday,
    COUNT(*) AS orders
FROM Walmart_clean
GROUP BY DATENAME(WEEKDAY, transaction_date)
ORDER BY orders DESC;


SELECT customer_loyalty_level,
    SUM(quantity_sold * unit_price) AS revenue
FROM Walmart_clean
GROUP BY customer_loyalty_level;

SELECT customer_loyalty_level,
    AVG(customer_income) AS avg_income,
    SUM(quantity_sold * unit_price) AS revenue
FROM Walmart_clean
GROUP BY customer_loyalty_level;

SELECT 
    CASE 
        WHEN promotion_type IS NULL THEN 'No Promotion'
        ELSE promotion_type
    END AS promo_group,
    SUM(quantity_sold * unit_price) AS revenue
FROM Walmart_clean
GROUP BY 
    CASE 
        WHEN promotion_type IS NULL THEN 'No Promotion'
        ELSE promotion_type
    END;

    SELECT TOP 5 product_name,
    SUM(quantity_sold) AS total_sold
FROM Walmart_clean
GROUP BY product_name
ORDER BY total_sold DESC;

