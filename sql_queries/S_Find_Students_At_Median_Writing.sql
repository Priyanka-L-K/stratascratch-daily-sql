-- median using floor and ceil
-- count() without using group by using count(*) over ()

WITH cte AS (
    SELECT 
        id,
        sat_writing,
        ROW_NUMBER() OVER(ORDER BY sat_writing) AS rw,
        COUNT(*) OVER() AS cnt 
    FROM sat_scores
)
SELECT id 
FROM cte
WHERE sat_writing IN (
    SELECT sat_writing 
    FROM cte 
    WHERE rw IN (FLOOR((cnt+1)/2), CEIL((cnt+1)/2))
);
