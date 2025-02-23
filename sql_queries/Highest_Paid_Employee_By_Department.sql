select department, worker_id, salary
from (
select *,
dense_rank() over (partition by department order by salary desc) as d_r
from worker) as rankin
where d_r = 1;
