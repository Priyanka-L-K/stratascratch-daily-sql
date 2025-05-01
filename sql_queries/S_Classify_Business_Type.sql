select distinct business_name,
case 
    when lower(business_name) regexp '.*restaurant*.' then 'Restaurant'
    when lower(business_name) regexp '.*caf[eé]*.' then 'Cafe'
    when lower(business_name) regexp '.*coffee*.' then 'Cafe'
    when lower(business_name) regexp '.*school*.' then 'School'
    else 'Other'
end as classification
from sf_restaurant_health_violations;
