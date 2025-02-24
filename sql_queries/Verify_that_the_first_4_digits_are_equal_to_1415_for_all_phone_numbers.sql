My answer

select 
sum(case when business_phone_number REGEXP '^1415*' then 0 else 1 end) as cnts_with_no_1415
from sf_restaurant_health_violations;

Optmized
  
SELECT 
    COUNT(*) AS businesses_with_wrong_prefix
FROM sf_restaurant_health_violations
WHERE business_phone_number IS NULL 
   OR business_phone_number NOT REGEXP '^1415';

SELECT COUNT(*) AS non_1415_phone_count
FROM sf_restaurant_health_violations
WHERE LEFT(business_phone_number, 4) != '1415';
