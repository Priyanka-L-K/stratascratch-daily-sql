My answer

with initial_data as (select request_id, call_duration,
rank() over (partition by request_id order by created_on) as initial_call
from redfin_call_tracking)

select avg(call_duration)
from initial_data
where initial_call = 1;

Optimized

SELECT AVG(call_duration)
FROM (
    SELECT
        call_duration,
        ROW_NUMBER() OVER (PARTITION BY request_id ORDER BY created_on) AS rn
    FROM redfin_call_tracking
) AS first_calls
WHERE rn = 1;
