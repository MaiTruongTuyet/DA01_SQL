--Ex1:
SELECT
SUM(CASE
  WHEN device_type ='laptop' THEN count(DISTINCT user_id)
END )AS laptop_views,
SUM(CASE
  WHEN device_type ='phone' THEN count(DISTINCT user_id)
END ) AS mobile_views
from viewership
GROUP BY device_type

--EX2:
SELECT X,Y,Z,
CASE
WHEN (X+Y ) > Z THEN 'Yes'
ELSE 'No'
END as triangle 
FROM Triangle 

--EX3:
SELECT
  ROUND((SUM(CASE 
    WHEN call_category IS NULL OR call_category = 'n/a' OR call_category = '' 
    THEN 1 ELSE 0 END)  / COUNT(*))*100, 1) AS Call_percentage
FROM callers;

--EX4:
SELECT name FROM CUSTOMER
WHERE referee_id  IS NULL or referee_id = 1

--EX5:
select 
CASE 
WHEN pclass = 1 THEN 'first_class'
WHEN pclass = 2 THEN 'second_class'
ELSE 'third_class'
END AS CLASS,
SUM(CASE
WHEN survived =0 THEN 1
END) AS non_survivors,
SUM(CASE
WHEN survived =1 THEN 1
END) AS survivors
from titanic
GROUP BY CLASS
