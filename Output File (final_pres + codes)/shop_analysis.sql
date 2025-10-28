SELECT*
FROM BRIGHT.COFFEE.SHOP;

---checking the number of coffee shops
SELECT DISTINCT store_location
FROM BRIGHT.COFFEE.SHOP;

---Checking the number of unique products
SELECT DISTINCT product_category
FROM BRIGHT.COFFEE.SHOP;

---checking the first operating date and
SELECT MIN(transaction_date) AS first_operating_date
FROM BRIGHT.COFFEE.SHOP;
---last day of transaction
SELECT MAX(transaction_date) AS last_day_transaction
FROM BRIGHT.COFFEE.SHOP;

---opening and closing times
SELECT MIN(transaction_time) AS opening_time
FROM BRIGHT.COFFEE.SHOP;

SELECT MAX(transaction_time) AS closing_time
FROM BRIGHT.COFFEE.SHOP;

----------------------------------------------------------------------------------------------------------
SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name,
CASE
       WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'Weekend'
       ELSE 'Weekday'
       END AS day_classification,
       MONTHNAME(transaction_date) AS month_name,
       transaction_time,
CASE
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
       WHEN transaction_time >= '17:00:00' THEN 'Evening'
       END AS time_bucket,
       HOUR(transaction_time) AS hour_of_day,
       store_location,
       product_category,
       product_detail,
       product_type,
       unit_price,
       transaction_qty,
       unit_price*transaction_qty AS revenue
FROM BRIGHT.COFFEE.SHOP;
       

