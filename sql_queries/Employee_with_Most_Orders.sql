with data as (select s_e.id, s_e.last_name, count(*) as cnts
from shopify_orders as s_o
inner join shopify_employees as s_e
on s_o.resp_employee_id = s_e.id
group by s_e.id, s_e.last_name)

select last_name
from (select last_name, dense_rank() over(order by cnts desc) as rn from data) as dat
where rn = 1;
