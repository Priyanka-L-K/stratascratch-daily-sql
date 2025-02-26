My answer

with ma as (select company_id, month(date) as march, count(*) as ma_cnt
from rc_calls as r_c
join rc_users as r_u
on r_c.user_id = r_u.user_id
where month(date) = '03'
group by company_id),

ap as (select company_id, month(date) as april, count(*) as ap_cnt
from rc_calls as r_c
join rc_users as r_u
on r_c.user_id = r_u.user_id
where month(date) = '04'
group by company_id)

select ma.company_id, march, april, ma_cnt, ap_cnt, ap_cnt - ma_cnt as diff
from ma 
join ap
on ma.company_id = ap.company_id
order by diff asc
limit 1;

Optimized

WITH MonthlyCounts AS (
    SELECT
        r_u.company_id,
        SUM(CASE WHEN MONTH(r_c.date) = 3 THEN 1 ELSE 0 END) AS march_count,
        SUM(CASE WHEN MONTH(r_c.date) = 4 THEN 1 ELSE 0 END) AS april_count
    FROM rc_calls AS r_c
    JOIN rc_users AS r_u ON r_c.user_id = r_u.user_id
    WHERE MONTH(r_c.date) IN (3, 4)  -- Filter for relevant months
    GROUP BY r_u.company_id
)
SELECT
    company_id,
    march_count,
    april_count,
    april_count - march_count AS diff
FROM MonthlyCounts
ORDER BY diff ASC
LIMIT 1;
