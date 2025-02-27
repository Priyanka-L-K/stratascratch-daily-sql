-- LIKE and REGEXP Cannot Be Used Together
-- Fix: Use REGEXP alone (not LIKE REGEXP).

with employees as (select employee_id, count(*) as no_vote, dense_rank() over (order by count(*) desc) as rn
from customer_responses
where customer_response REGEXP '[0-9]{10}'
group by employee_id
order by no_vote desc)

select employee_id, no_vote
from employees
where rn = 1;
