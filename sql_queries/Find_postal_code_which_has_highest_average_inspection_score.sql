select business_postal_code
from (select business_postal_code, dense_rank() over (order by avg(inspection_score) desc) as rn
from sf_restaurant_health_violations
group by business_postal_code) as rns
where rn = 1;
