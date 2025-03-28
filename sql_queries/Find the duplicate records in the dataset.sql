select worker_title, affected_from, count(*)
from title
group by worker_title, affected_from
having count(*) > 1;
