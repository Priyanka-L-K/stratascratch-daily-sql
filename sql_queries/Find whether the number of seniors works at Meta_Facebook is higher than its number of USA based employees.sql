with seniors as (select count(*) as cnt
from facebook_employees
where is_senior = 1),

usa_employees as (select count(*) as i_cnt
from facebook_employees
where location = 'USA' and is_senior = 0)

select case 
when seniors.cnt > usa_employees.i_cnt then 'More_seniors' 
else 'More_USA-based'
end as result
from seniors, usa_employees;
