select first_name
from worker
where salary = (select max(salary) from worker);
