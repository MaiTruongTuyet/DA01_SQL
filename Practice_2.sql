--EX 1
SELECT DISTINCT CITY FROM STATION
WHERE ID % 2 = 0

--EX 2
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION
  
--EX 4
SELECT ROUND(((SUM(item_count * order_occurrences) / SUM(order_occurrences)):: NUMERIC),1)
FROM items_per_order 

