select count(*)
from los_angeles_restaurant_health_inspections
where EXTRACT(YEAR FROM activity_date) = 2017 and pe_description ilike '%low risk%'; 
