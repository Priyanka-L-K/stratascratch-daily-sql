select grade, max(score) as upper_bound, min(score) as lower_bound, 
case 
    when grade = 'A' then concat('Score > ', max(score) ,' AND Score <= ', min(score), ' => Grade = A')
    when grade = 'B' then concat('Score > ', max(score) ,' AND Score <= ', min(score), ' => Grade = B')
    when grade = 'C' then concat('Score > ', max(score) ,' AND Score <= ', min(score), ' => Grade = C')
end as rule
from los_angeles_restaurant_health_inspections
group by grade;


-- USING CONCAT TO DYNAMICALLY CHANGE VALUES IN THE RULE STATEMENTS
