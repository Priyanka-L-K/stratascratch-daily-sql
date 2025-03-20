select e.first_name, e.salary
from employee as e
inner join employee as m
on e.manager_id = m.id
where e.salary > m.salary;
