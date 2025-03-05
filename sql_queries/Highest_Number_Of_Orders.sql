select id, cnts
from (select c.id, count(o.id) as cnts, dense_rank() over(order by count(o.id) desc) as dr
from customers as c
inner join orders as o
on c.id = o.cust_id
group by c.id) as ranks
where dr = 1;
