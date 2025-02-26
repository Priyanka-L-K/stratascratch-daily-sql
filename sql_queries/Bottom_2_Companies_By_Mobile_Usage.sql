My answer

with mobile_data as (select customer_id, count(*) as num_of_events
from fact_events
where client_id = 'mobile'
group by customer_id),

rank_companies as (select *,
dense_rank() over (order by num_of_events asc) as d_r
from mobile_data)

select *
from rank_companies
where d_r <= 2;

Optimized

SELECT customer_id, num_of_events
FROM (
    SELECT customer_id, 
           COUNT(*) AS num_of_events,
           DENSE_RANK() OVER (ORDER BY COUNT(*) ASC) AS d_r
    FROM fact_events
    WHERE client_id = 'mobile'
    GROUP BY customer_id
) AS ranked_companies
WHERE d_r <= 2;
