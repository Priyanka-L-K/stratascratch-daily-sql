My answer

select *
from (select cust_id, count(*) as n
from orders
group by cust_id) as nm
where n > 3;

Optimized:

SELECT cust_id, COUNT(*) AS n
FROM orders
GROUP BY cust_id
HAVING n > 3;
