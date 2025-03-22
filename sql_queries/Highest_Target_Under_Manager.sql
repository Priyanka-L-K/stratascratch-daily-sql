select first_name, target
from (select first_name, target, dense_rank() over (order by target desc) as rn
from salesforce_employees
where manager_id = 13) as manager_records
where rn = 1;
