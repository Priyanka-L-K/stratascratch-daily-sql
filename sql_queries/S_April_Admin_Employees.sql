Mine:
select count(*)
from worker
WHERE MONTH(joining_date) in (4,5,6,7,8,910,11,12) and department = 'Admin';

Optimized:
select count(*)
from worker
WHERE MONTH(joining_date) BETWEEN 4 AND 12 and department = 'Admin';
