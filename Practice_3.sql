--EX1
SELECT NAME FROM
STUDENTS
WHERE MARKS >75
ORDER BY RIGHT(NAME,3), ID

--EX2
SELECT user_id, CONCAT(UPPER(LEFT(NAME,1)), LOWER(RIGHT(NAME,LENGTH(NAME)-1))) AS name
FROM Users
ORDER BY user_id

--EX3
SELECT manufacturer, CONCAT('$',ROUND(SUM(total_sales)/1000000,0),'million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY manufacturer

--EX4
SELECT EXTRACT(MONTH FROM submit_date) as mth, 
product_id AS product, 
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), PRODUCT_ID
ORDER BY EXTRACT(MONTH FROM submit_date), PRODUCT_ID

--EX5

