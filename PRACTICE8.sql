--Ex1 Immediate Food Delivery II

WITH result as (
SELECT *
FROM (
SELECT
    *,(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) as immediate,
    RANK() OVER(PARTITION BY customer_id ORDER BY order_date) as first_order
FROM Delivery
) AS B
WHERE first_order = 1
)
--Tính trung bình những đơn hàng immediate
SELECT ROUND(SUM(immediate) *100 / COUNT(first_order),2) as immediate_percentage
FROM result

--Ex2 
