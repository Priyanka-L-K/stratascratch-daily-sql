-- my code

with ranked_ins as (select date_format(activity_date, '%Y-%m') as inspection_date, count(*) as ins, dense_rank() over (order by count(*)) as rn
from los_angeles_restaurant_health_inspections
group by inspection_date
order by ins asc)

select inspection_date, ins
from ranked_ins
where rn = 1


-- optimized:
  
WITH inspection_counts AS (
    SELECT 
        DATE_FORMAT(activity_date, '%Y-%m') AS inspection_month,
        COUNT(*) AS total_inspections
    FROM los_angeles_restaurant_health_inspections
    GROUP BY inspection_month
)
SELECT 
    inspection_month, 
    total_inspections
FROM inspection_counts
WHERE total_inspections = (SELECT MIN(total_inspections) FROM inspection_counts);
