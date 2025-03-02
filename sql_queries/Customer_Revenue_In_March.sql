select cust_id, sum(total_order_cost) as revenue
from orders
where date_format(order_date, '%Y-%m') = '2019-03'
group by cust_id;
