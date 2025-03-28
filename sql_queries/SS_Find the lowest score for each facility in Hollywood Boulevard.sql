-- regex in where i dont think it takes into consideration all the variety of Hollywood Boulevard

select facility_name, min(score) as lowest_score
from los_angeles_restaurant_health_inspections
where UPPER(facility_address) LIKE '%HOLLYWOOD BLVD%'
group by facility_name
order by lowest_score asc;
