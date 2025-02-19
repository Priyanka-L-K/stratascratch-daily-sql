My answer

with update_data as (select request_id, call_duration,
rank() over (partition by request_id order by created_on) as update_call
from redfin_call_tracking)

select request_id, avg(call_duration)
from update_data
where update_call > 1
group by request_id;
