-- consider ties as well

My answer

select reaction, count(*) as cnts
from facebook_reactions
where date_day = 1
group by reaction
order by cnts desc
limit 1;

Optimized

WITH ranked_reactions AS (
    SELECT reaction, COUNT(*) AS cnts, 
           DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
    FROM facebook_reactions
    WHERE date_day = 1
    GROUP BY reaction
)
SELECT reaction, cnts 
FROM ranked_reactions
WHERE rnk = 1;
