My answer

select customer_id, count(*) as num_of_users
from fact_events
where client_id = 'desktop'
group by customer_id
order by num_of_users desc
limit 1;
