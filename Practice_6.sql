--EX1
WITH job_count_cte AS (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count >= 2;

--EX3
with cte as
(
SELECT count(distinct
policy_holder_id) as m from callers
GROUP BY policy_holder_id 
HAVING count(case_id)>=3
)
SELECT sum(m) as member_count FROM cte

--EX4
SELECT a.page_id
from pages as a 
left join page_likes as b
on a.page_id = b.page_id
where liked_date is null
order by a.page_id ASC

  
--EX5
select 
extract(month from a.event_date) "month", 
count(distinct a.user_id) monthly_active_users
from user_actions a
join user_actions b
on extract(month from a.event_date) - extract(month from b.event_date) = 1 and 
  a.user_id = b.user_id
where extract(month from a.event_date) = 7 and 
      extract(year from a.event_date) = 2022
group by extract(month from a.event_date)

--EX6
--EX7
SELECT product_id, year as first_year, quantity, price
from Sales
where (product_id, year) in 
    (SELECT product_id, min(year) 
     from Sales 
     group by 1)
  
--EX8
SELECT
    DISTINCT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT( DISTINCT product_key) = (SELECT COUNT(*) FROM product)
  
--EX9
SELECT employee_id 
FROM Employees
WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
AND salary < 30000
ORDER BY employee_id;

--EX11
(SELECT name  as results
FROM Users
WHERE user_id IN (SELECT user_id 
FROM MovieRating
GROUP BY user_id )
ORDER BY  name     
LIMIT 1)
UNION
(SELECT A.title 
FROM Movies AS A
JOIN MovieRating AS B
ON A.movie_id = B.movie_id 
WHERE YEAR(B.created_at ) =2020 AND MONTH(B.created_at ) =2
GROUP BY 1
ORDER BY AVG(B.rating) DESC, 1
LIMIT 1)
  
--EX12
WITH
    request AS (
        SELECT requester_id, accepter_id FROM RequestAccepted
        UNION
        SELECT accepter_id, requester_id FROM RequestAccepted
    )
SELECT requester_id AS id, COUNT(accepter_id) AS num
FROM request
GROUP BY requester_id
ORDER BY 2 DESC
LIMIT 1;
