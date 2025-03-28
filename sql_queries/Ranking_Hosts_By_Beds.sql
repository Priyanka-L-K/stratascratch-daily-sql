select host_id, sum(n_beds), dense_rank() over(order by sum(n_beds) desc) as rn
from airbnb_apartments
group by host_id
order by rn;
