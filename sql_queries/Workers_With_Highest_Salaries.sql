-- every derived table i.e subquery not CTE must have a name

select worker_title
from (select w.worker_id, w.first_name, w.last_name, w.salary, t.worker_title,
dense_rank() over(order by w.salary desc) as rn
from worker as w
inner join title as t
on w.worker_id = t.worker_ref_id) as ranked_salary
where rn = 1;
