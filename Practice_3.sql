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
SELECT sender_id, COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(YEAR FROM sent_date) = 2022
AND EXTRACT(MONTH FROM sent_date) = 8
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2

--EX6
SELECT  tweet_id
FROM Tweets
WHERE LENGTH(CONTENT) > 15

--EX7

--EX8
SELECT COUNT(ID)
FROM employees
WHERE EXTRACT(MONTH FROM joining_date ) BETWEEN 1 AND 7
AND EXTRACT(MONTH FROM joining_date ) = 2022

--EX9
SELECT POSITION('a'in first_name )
FROM worker
WHERE first_name = 'Amitah'

--EX10

