select lrl.user_id, lu.name, sum(lrl.distance) as dist
from lyft_rides_log as lrl
inner join lyft_users as lu
on lrl.user_id = lu.id
group by lrl.user_id, lu.name
order by dist desc;
