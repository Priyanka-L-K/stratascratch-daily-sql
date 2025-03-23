-- select variety, max(price)
-- from winemag_p1
-- where country = 'US' AND points >= 90 AND variety not in (select variety from winemag_p1 where country != 'US')
-- group by variety;

WITH valid_varieties AS (
    SELECT variety
    FROM winemag_p1
    GROUP BY variety
    HAVING MIN(points) >= 90
),
no_spanish_overlap AS (
    SELECT variety
    FROM winemag_p1
    WHERE country = 'US'
    AND variety NOT IN (SELECT DISTINCT variety FROM winemag_p1 WHERE country NOT IN ('US'))
)
SELECT v.variety, MAX(w.price) AS max_price
FROM winemag_p1 w
JOIN no_spanish_overlap v ON w.variety = v.variety
WHERE w.country = 'US'
  AND w.variety IN (SELECT variety FROM valid_varieties)
GROUP BY v.variety;
