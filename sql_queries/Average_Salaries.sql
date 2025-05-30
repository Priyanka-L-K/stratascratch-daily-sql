Mine:
with avg_s as 
(select department, avg(salary) as avg_salary
from employee
group by department)

select e.department, e.first_name, e.salary, a.avg_salary
from employee as e
inner join avg_s as a
on e.department = a.department;


Optimized:
SELECT 
  department,
  first_name,
  salary,
  AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employee
ORDER BY department;
