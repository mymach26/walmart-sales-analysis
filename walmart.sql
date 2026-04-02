WALMART SALES ANALYSIS

--1. DATA EXPLORATION    
SELECT TOP 10 *
FROM Walmart_clean;

--2. REVENUE BY STORE
SELECT store_location,
    SUM(quantity_sold * unit_price) AS total_revenue,
    COUNT(*) AS total_orders,
    AVG(quantity_sold * unit_price) AS avg_order_value
FROM Walmart_clean
GROUP BY store_location
ORDER BY total_revenue DESC;

--3. REVENUE BY CATEGORY
SELECT category,
    SUM(quantity_sold * unit_price) AS revenue
FROM Walmart_clean
GROUP BY category
ORDER BY revenue DESC;

--4. PEAK HOUR ANALYSIS
SELECT 
    DATEPART(HOUR, transaction_date) AS hour,
    COUNT(*) AS orders
FROM Walmart_clean
GROUP BY DATEPART(HOUR, transaction_date)
ORDER BY orders DESC;

--5. DAY OF WEEK ANALYSIS
SELECT 
    DATENAME(WEEKDAY, transaction_date) AS weekday,
    COUNT(*) AS orders
FROM Walmart_clean
GROUP BY DATENAME(WEEKDAY, transaction_date)
ORDER BY orders DESC;

--6. CUSTOMER LOYALTY ANALYSIS
SELECT customer_loyalty_level,
    SUM(quantity_sold * unit_price) AS revenue
FROM Walmart_clean
GROUP BY customer_loyalty_level;

--7.INCOME VS SPENDING
SELECT customer_loyalty_level,
    AVG(customer_income) AS avg_income,
    SUM(quantity_sold * unit_price) AS revenue
FROM Walmart_clean
GROUP BY customer_loyalty_level;

--8. PROMOTION EFFECTIVENESS
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

--9. TOP PRODUCTS
    SELECT TOP 5 product_name,
    SUM(quantity_sold) AS total_sold
FROM Walmart_clean
GROUP BY product_name
ORDER BY total_sold DESC;