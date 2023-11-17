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
WHEN (X+Y ) > Z and (Y+ Z) > X  and (x+z) > Y THEN 'Yes'
ELSE 'No'
END as triangle 
FROM Triangle 

--EX3:
SELECT
  ROUND((SUM(CASE 
    WHEN call_category IS NULL OR call_category = 'n/a' 
    THEN 1 ELSE 0 END)  / COUNT(*))*100, 1) AS Call_percentage
FROM callers;

--EX4:
SELECT name FROM CUSTOMER
WHERE referee_id  IS NULL or referee_id = 1

--EX5:
select survived, 
sum(case when pclass =1 then 1 else 0 end ) as first_class,
sum(case when pclass =2 then 1 else 0 end ) as second_class,
sum(case when pclass =3 then 1 else 0 end ) as third_class
from titanic
group by survived
