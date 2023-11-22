--ex1
select b.continent as 'Continent', floor(avg(a.population))
from city as a
join country as b
on a.countrycode = b.code
group by b.continent

--ex2
SELECT 
round(sum(case when t.signup_action ='Confirmed' then 1
else 0
end)*1.0/count(*),2)
from emails e
inner JOIN texts t 
on e.email_id = t.email_id

--ex5
select e1.reports_to as employee_id, e2.name,count(e1.reports_to) as reports_count,
round(avg(e1.age),0) as average_age
from employees e1
join employees e2
on e1.reports_to=e2.employee_id
group by e1.reports_to
order by e1.reports_to

--ex6
select a.product_name, sum(b.unit)  as unit
from Products as a
join Orders as b
on a.product_id  = b.product_id  
where year(b.order_date)= 2020 and month(b.order_date) = 2
group by a.product_id
having sum(b.unit) >= 100

--ex7
SELECT a.page_id
from pages as a 
left join page_likes as b
on a.page_id = b.page_id
where liked_date is null
order by a.page_id ASC
