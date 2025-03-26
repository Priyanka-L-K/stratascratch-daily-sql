select city, cnt, rank() over(order by cnt desc) as rn
from (select city, count(*) as cnt
from yelp_business
where stars = 5
group by city) as der;
