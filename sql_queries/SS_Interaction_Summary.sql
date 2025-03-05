-- issues:
-- 1. using inner join is not right: some customers might have intercations and no content or vice versa so using inner join restricts thta
-- 2. using inner join causes duplicates if suctomer has 3 interactions and 2 contents then using inner join causes 5 rows in result which is not right need to use left join

My answer

select c_i.customer_id, count(c_i.interaction_id) as cnts_interactions, count(u_c.content_id) as cnts_content
from customer_interactions as c_i
inner join user_content as u_c
on c_i.customer_id = u_c.customer_id
group by customer_id
order by cnts_interactions desc, cnts_content desc;

Optimized

SELECT 
    customer_id, 
    SUM(CASE WHEN interaction_id IS NOT NULL THEN 1 ELSE 0 END) AS cnts_interactions, 
    SUM(CASE WHEN content_id IS NOT NULL THEN 1 ELSE 0 END) AS cnts_content
FROM (
    SELECT customer_id, interaction_id, NULL AS content_id FROM customer_interactions
    UNION ALL
    SELECT customer_id, NULL AS interaction_id, content_id FROM user_content
) AS combined
GROUP BY customer_id
ORDER BY cnts_interactions DESC, cnts_content DESC;
