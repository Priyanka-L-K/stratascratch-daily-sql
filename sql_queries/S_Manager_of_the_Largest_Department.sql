with dep_em as (select department_id, department_name, count(*) as num_em,
dense_rank() over (order by count(*) desc) as rn
from az_employees
group by department_id, department_name)

select d_e.department_id, d_e.department_name, a_e.first_name, a_e.last_name, a_e.position
from dep_em as d_e
join az_employees as a_e
on d_e.department_id = a_e.department_id
where d_e.rn = 1 and a_e.position LIKE '%Manager%';
