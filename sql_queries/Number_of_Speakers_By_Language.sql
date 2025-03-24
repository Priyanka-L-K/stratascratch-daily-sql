select pe.location, pu.`language`, count(*) as cnt
from playbook_events as pe
inner join playbook_users as pu
on pe.user_id = pu.user_id
group by pe.location, pu.`language`
order by pe.location asc;
