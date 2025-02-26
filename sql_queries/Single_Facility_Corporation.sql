select owner_name
from los_angeles_restaurant_health_inspections
group by owner_name
having count(*) = 1
order by owner_name;
