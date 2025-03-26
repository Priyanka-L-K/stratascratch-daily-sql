select ar.from_user as 'host_user', avg(ag.age)
from airbnb_reviews as ar
inner join airbnb_guests as ag
on ar.to_user = ag.guest_id
where from_type = 'host'
group by ar.from_user
order by ar.from_user;
