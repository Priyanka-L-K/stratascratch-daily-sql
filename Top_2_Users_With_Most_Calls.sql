My answer:

with cte as (select r_u.user_id, count(*) as number_of_cnts, r_u.company_id
from rc_calls as r_c
join rc_users as r_u
on r_c.user_id = r_u.user_id
group by r_u.user_id),

cte1 as (select *,
dense_rank() over (partition by company_id order by number_of_cnts desc) as d_r
from cte)

select company_id, user_id, d_r
from cte1
where d_r <= 2;


Rewritten:

WITH UserCallCounts AS (
    SELECT
        r_u.user_id,
        r_u.company_id,
        COUNT(*) AS number_of_calls
    FROM rc_calls AS r_c
    JOIN rc_users AS r_u ON r_c.user_id = r_u.user_id
    GROUP BY r_u.user_id, r_u.company_id
),
RankedUsers AS (
    SELECT
        user_id,
        company_id,
        number_of_calls,
        DENSE_RANK() OVER (PARTITION BY company_id ORDER BY number_of_calls DESC) AS user_rank
    FROM UserCallCounts
)
SELECT
    company_id,
    user_id,
    user_rank
FROM RankedUsers
WHERE user_rank <= 2;
