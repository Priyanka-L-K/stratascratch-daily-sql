select department, count(*) as cnts
from worker
group by department
having cnts < 4;
