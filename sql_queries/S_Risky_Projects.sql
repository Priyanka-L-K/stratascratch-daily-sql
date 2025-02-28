-- i understood the question properly but made some mistakes btw which i learnt
-- 1. wrong way to calculate project duration using timestampdiff with month calculates whole months and not those extra days
-- 2. wrong way to calculated prorated salary using 12 instead of 365 because there we are not considering leap years
-- 3. using round instead of ceil we dont want decimals
  
with calc_data as(select l_p.title, l_p.budget, timestampdiff(month, l_p.start_date, l_p.end_date) as project_duration, l_e_p.emp_id, l_e.first_name, l_e.salary as annual_salary, round((l_e.salary / 12) * timestampdiff(month, l_p.start_date, l_p.end_date), 2) as project_prorated_salary
from linkedin_projects as l_p
inner join linkedin_emp_projects as l_e_p
on l_p.id = l_e_p.project_id
inner join linkedin_employees as l_e
on l_e_p.emp_id = l_e.id
order by l_p.title)

select title, budget, prorated_employee_expense
from (select title, budget, project_duration, sum(project_prorated_salary) as prorated_employee_expense,
case when sum(project_prorated_salary) > budget then 'overbudget' else 'underbudget' end as res
from calc_data
group by title) as prorated_data
where res = 'overbudget'
order by title;


-- Easy:

SELECT title,
       budget,
       CEILING((DATEDIFF(end_date, start_date) * SUM(salary)/365)) AS prorated_employee_expense
FROM linkedin_projects a
INNER JOIN linkedin_emp_projects b ON a.id = b.project_id
INNER JOIN linkedin_employees c ON b.emp_id=c.id
GROUP BY title, budget, end_date, start_date
HAVING prorated_employee_expense > budget
ORDER BY title ASC
