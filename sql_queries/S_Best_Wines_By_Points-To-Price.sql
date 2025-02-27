My answer

select title, points, price, points/price as points_to_price_ratio
from winemag_p2
order by points_to_price_ratio desc
limit 1;

Optimized

SELECT 
    title, 
    points, 
    price, 
    points / NULLIF(price, 0) AS points_to_price_ratio
FROM winemag_p2
WHERE price IS NOT NULL AND points IS NOT NULL  -- Ensures valid data
ORDER BY points_to_price_ratio DESC
LIMIT 1;  -- Get only the best wine
