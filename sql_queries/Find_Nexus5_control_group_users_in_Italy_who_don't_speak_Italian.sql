select p_e.user_id, p_u.`language`, p_e.occurred_at, p_e.location 
from playbook_experiments as p_e
join playbook_users as p_u
on p_e.user_id = p_u.user_id
where experiment_group = 'control_group' and location = 'Italy' and `language` != 'Italian'
order by p_e.occurred_at;
