SELECT c.id, c.first_name, c.last_name
FROM customers AS c
LEFT JOIN orders o
ON c.id = o.cust_id
WHERE o.cust_id IS NULL;
