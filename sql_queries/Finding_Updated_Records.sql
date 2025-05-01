select id, first_name, last_name, department_id, max(salary) as current_salary
from ms_employee_salary
group by id, first_name, department_id;
