My answer

select DAYNAME(signup_start_date) AS day_of_week, billing_cycle, count(*) as num_of_signups
from signups as s_g
inner join plans as p
on s_g.plan_id = p.id
group by day_of_week, billing_cycle
order by field(day_of_week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
