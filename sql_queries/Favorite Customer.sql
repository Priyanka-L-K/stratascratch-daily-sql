select c.first_name, c.city, count(o.id) as total_orders, sum(o.total_order_cost) as total_cost
from customers as c
inner join orders as o
on c.id = o.cust_id
group by c.first_name
having total_orders > 3 and total_cost > 100
order by c.id, c.first_name, c.city;
