My answer

select first_name, last_name, num_of_days, working
from (
select first_name, last_name,
case 
    when termination_date is not null then datediff(date(termination_date), date(hire_date))
    when termination_date is null then datediff(date('2021-05-01'), date(hire_date))
end as num_of_days, 
case
    when termination_date is not null then 'no'
    when termination_date is null then 'yes'
end as working
from uber_employees) as morethan2
where num_of_days > 730;

optimized

SELECT first_name, 
       last_name, 
       CASE 
           WHEN termination_date IS NOT NULL THEN DATEDIFF(DATE(termination_date), DATE(hire_date))
           WHEN termination_date IS NULL THEN DATEDIFF(DATE('2021-05-01'), DATE(hire_date))
       END AS num_of_days,
       CASE
           WHEN termination_date IS NOT NULL THEN 'no'
           WHEN termination_date IS NULL THEN 'yes'
       END AS working
FROM uber_employees
WHERE 
    (CASE 
        WHEN termination_date IS NOT NULL THEN DATEDIFF(DATE(termination_date), DATE(hire_date))
        WHEN termination_date IS NULL THEN DATEDIFF(DATE('2021-05-01'), DATE(hire_date))
    END) > 730;
