select business_name, count(*) as cnts
from sf_restaurant_health_violations
where risk_category is not null
group by business_name
order by cnts desc;
