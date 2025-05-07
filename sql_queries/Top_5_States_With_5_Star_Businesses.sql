with cnt as 
(select state, count(distinct business_id) as bu_cn
from yelp_business
where stars = 5
group by state
order by bu_cn desc),

rn as 
(select state, bu_cn, dense_rank() over(order by bu_cn desc) as r
from cnt)

select state, bu_cn
from rn
where r <= 5;
