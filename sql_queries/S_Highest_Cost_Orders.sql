-- Mistakes I did:
-- 1. confused between when to use where and having
-- 2. while having raw dates USE date('xxxx-xx-xx') i forgot single quotes
-- 3. rookie mistake need to use same columns in select and group by along with aggregates

select c.first_name, o.order_date, sum(o.total_order_cost) as max_cost
from customers as c
inner join orders as o
on c.id = o.cust_id
where date(o.order_date) between date('2019-02-01') and date('2019-05-01')
group by c.first_name, date(o.order_date)
order by max_cost desc
limit 1;
