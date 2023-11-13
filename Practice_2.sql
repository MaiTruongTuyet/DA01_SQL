--EX 1
SELECT DISTINCT CITY FROM STATION
WHERE ID % 2 = 0

--EX 2
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION

--EX 3

  
--EX 4
SELECT ROUND(((SUM(item_count * order_occurrences) / SUM(order_occurrences)):: NUMERIC),1)
FROM items_per_order 

--EX5
SELECT DISTINCT candidate_id 
FROM candidates
WHERE SKILL in('Python','Tableau','PostgreSQL') 

--EX 6
SELECT USER_ID, DATE(MAX(POST_DATE)) - DATE(MIN(POST_DATE))AS DAYS_BETWEEN
FROM POSTS
WHERE POST_DATE BETWEEN '2021-01-01' AND '2022-01-01'
GROUP BY USER_ID
HAVING COUNT(POST_ID) >= 2;

-- EX7
SELECT card_name, MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name

--EX 8
SELECT manufacturer, COUNT(drug) AS drug_count,
ABS(SUM(cogs - total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - (cogs) < 0
GROUP BY manufacturer
ORDER BY total_loss DESC
--EX 9
SELECT *
FROM Cinema
WHERE id % 2 != 0 and description != 'boring'
ORDER BY rating DESC

-- EX10
SELECT teacher_id, count(distinct subject_id) as cnt
FROM Teacher
GROUP BY teacher_id 

-- EX11
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id

--EX12
SELECT class
FROM Courses
GROUP BY class
HAVING count(student) >=5

