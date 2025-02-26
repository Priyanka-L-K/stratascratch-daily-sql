-- Both codes gives the same answer because there is no duplicate product codes

-- My answer

select productcode, unitprice
from online_retails
where unitprice > (select avg(unitprice) as avgprice
from online_retails
where quantity > 0)


-- Optimized

WITH original_prices AS (
    -- Step 1: Get the original (minimum) unit price per productcode for sold products
    SELECT 
        productcode, 
        MIN(unitprice) AS original_price
    FROM online_retails
    WHERE quantity > 0  -- Only sold products
    GROUP BY productcode
),

average_price AS (
    -- Step 2: Calculate the average of these original prices
    SELECT AVG(original_price) AS avg_price
    FROM original_prices
)

-- Step 3: Find products where original price > average price
SELECT 
    productcode, 
    original_price AS unitprice
FROM original_prices
WHERE original_price > (SELECT avg_price FROM average_price);
