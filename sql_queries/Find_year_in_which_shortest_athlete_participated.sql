-- need to consider same height in multiple years

-- My answe:

select year
from olympics_athletes_events
where height IS NOT NULL
order by height asc
limit 1;

-- Optimized:

WITH shortest_height AS (
    SELECT MIN(height) AS min_height
    FROM olympics_athletes_events
    WHERE height IS NOT NULL
)
SELECT year, height
FROM olympics_athletes_events
WHERE height = (SELECT min_height FROM shortest_height);
