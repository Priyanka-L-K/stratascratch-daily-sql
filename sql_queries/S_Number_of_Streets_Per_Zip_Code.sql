-- crazy this was lol
-- so the question was to consider the first word in street address and if it address is like pier 39 or 39 pier its same 

-- mistakes i did
-- 1. i just considered lower and didnt account first word -> so use substring(column, ' ', x) x is 1 means first word, 2 means two words like that
-- 2. if there is pier 39 or 39 pier then its basically nulling number -> so if address starts with number then do substring take first two and then do -1 to take last so its first word

My answer:

select count(distinct lower(business_address)) as cnts_street, business_postal_code
from sf_restaurant_health_violations
group by business_postal_code
order by cnts_street desc, business_postal_code asc;

Optimized:

with steet as (SELECT 
    business_postal_code, 
    case when regexp_like(business_address, "^[0-9]") then substring_index(SUBSTRING_INDEX(business_address, ' ', 2),' ', -1)
    else SUBSTRING_INDEX(business_address, ' ', 1) end AS unique_street_name
FROM sf_restaurant_health_violations)

select business_postal_code, count(distinct unique_street_name) as unique_street_count
from steet
where business_postal_code is not null
GROUP BY business_postal_code
ORDER BY unique_street_count DESC, business_postal_code ASC;
