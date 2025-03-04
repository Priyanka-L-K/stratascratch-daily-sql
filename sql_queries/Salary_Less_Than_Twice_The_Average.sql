with employee_avg as (select avg(d_e.salary) as emp_avg, m_e_h.manager_empl_id 
from map_employee_hierarchy as m_e_h
inner join dim_employee as d_e
on m_e_h.empl_id = d_e.empl_id -- we have employee detials
where m_e_h.manager_empl_id is not null
group by m_e_h.manager_empl_id)

select e_a.manager_empl_id, de.salary as manager_salary, e_a.emp_avg
from employee_avg as e_a
inner join dim_employee as de
on e_a.manager_empl_id = de.empl_id -- manager details
where de.salary < 2 * e_a.emp_avg
