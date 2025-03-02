-- need to use distinct on both i had to use distinct to get unique users

select p_u.language, count(distinct case when p_e.device in ('macbook pro', 'iphone 5s', 'ipad air') then p_e.user_id else null end) as apple_users, count(distinct p_e.user_id) as total_users
from playbook_events as p_e
inner join playbook_users as p_u
on p_e.user_id = p_u.user_id
group by p_u.language
order by total_users desc;
