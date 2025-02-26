My answer

select request_id, count(*) as cnt
from redfin_call_tracking
where hour(created_on) between 15 and 18
group by request_id
having cnt >= 3;
