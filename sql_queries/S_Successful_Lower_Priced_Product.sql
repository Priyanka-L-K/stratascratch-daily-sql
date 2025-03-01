-- instead of subquery we can use in one query by using having

My answer:

select product_id, brand_name
from (select o_p.product_id, o_p.brand_name, count(*) as cnts, avg(cost_in_dollars) as avg_cost
from online_products as o_p
inner join online_orders as o_o
on o_p.product_id = o_o.product_id
group by o_p.product_id) as pros
where cnts >= 2 and avg_cost >= 3;

Optimized:

SELECT o_p.product_id, o_p.brand_name
FROM online_products AS o_p
INNER JOIN online_orders AS o_o
    ON o_p.product_id = o_o.product_id
GROUP BY o_p.product_id, o_p.brand_name
HAVING COUNT(DISTINCT o_o.date_sold) >= 2
    AND AVG(o_o.cost_in_dollars) >= 3
ORDER BY o_p.product_id;
