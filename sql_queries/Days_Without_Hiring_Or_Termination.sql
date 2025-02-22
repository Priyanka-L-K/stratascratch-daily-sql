with hire_dates as (select first_name, last_name, hire_date
                    from uber_employees
                    where hire_date is not null
                    order by hire_date),
hire_gaps as (select datediff(hire_date, lag(hire_date) over(order by hire_date)) as hire_gap
              from hire_dates),
              
max_hire_gap as (select max(hire_gap) as longest_gap_without_hiring
from hire_gaps),

term_dates as (select first_name, last_name, termination_date
                    from uber_employees
                    where termination_date is not null
                    order by termination_date),
term_gaps as (select datediff(termination_date, lag(termination_date) over(order by termination_date)) as term_gap
              from term_dates),
              
max_term_gap as (select max(term_gap) as longest_gap_without_firing
from term_gaps)

SELECT 
    (SELECT longest_gap_without_hiring FROM max_hire_gap) AS longest_gap_without_hiring,
    (SELECT longest_gap_without_firing FROM max_term_gap) AS longest_gap_without_firing;
