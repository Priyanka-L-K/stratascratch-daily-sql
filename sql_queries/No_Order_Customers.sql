select first_name from customers
where id not in (SELECT c.id as cust_id_order from 
customers c LEFT JOIN orders o ON c.id = o.cust_id
where order_date between "2019-02-01" and "2019-03-01") ;
