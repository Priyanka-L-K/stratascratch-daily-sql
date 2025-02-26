select p_p.name as seller_name, avg(amount) as avg_order_amount
from postmates_orders as p_o
inner join postmates_markets as p_m
on p_o.city_id = p_m.id
inner join postmates_partners as p_p
on p_o.seller_id = p_p.id
WHERE p_m.name = 'Boston' AND LOWER(p_p.name) LIKE '%pizza%'
group by p_p.name;
