select email
from employee
group by email
having count(email) > 1;
