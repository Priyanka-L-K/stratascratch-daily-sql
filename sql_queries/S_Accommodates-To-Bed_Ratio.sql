-- nullif

select city, avg(accommodates/nullif(beds, 0)) avg_ratio
from airbnb_search_details
where room_type = 'Shared room'
group by city
order by avg_ratio desc;
