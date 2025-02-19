My answer:

WITH clean AS (
    SELECT
        p_o.city_id,
        DATE(p_o.order_timestamp_utc) AS date_given,
        p_o.amount,
        p_m.id,
        p_m.name AS city_name
    FROM postmates_orders AS p_o
    INNER JOIN postmates_markets AS p_m
        ON p_o.city_id = p_m.id
),

oneday AS (
    SELECT
        city_name,
        SUM(amount) AS one_day
    FROM clean
    WHERE date_given = '2019-03-11'
    GROUP BY city_name
),

twoday AS (
    SELECT
        city_name,
        SUM(amount) AS two_day
    FROM clean
    WHERE date_given = '2019-04-11'
    GROUP BY city_name
),

res AS (
    SELECT
        oneday.city_name,
        one_day,
        two_day,
        two_day - one_day AS growth_droop
    FROM oneday
    INNER JOIN twoday
        ON oneday.city_name = twoday.city_name
),

max_growth AS (
  SELECT *
  FROM res
  ORDER BY growth_droop DESC
  LIMIT 1
),

min_growth AS (
  SELECT *
  FROM res
  ORDER BY growth_droop ASC
  LIMIT 1
)

SELECT * FROM max_growth
UNION ALL
SELECT * FROM min_growth;

Optmized:

WITH clean AS (
    SELECT
        p_o.city_id,
        DATE(p_o.order_timestamp_utc) AS date_given,
        p_o.amount,
        p_m.id,
        p_m.name AS city_name
    FROM postmates_orders AS p_o
    INNER JOIN postmates_markets AS p_m
        ON p_o.city_id = p_m.id
),

city_sales AS (
    SELECT
        city_name,
        SUM(CASE WHEN date_given = '2019-03-11' THEN amount ELSE 0 END) AS one_day,
        SUM(CASE WHEN date_given = '2019-04-11' THEN amount ELSE 0 END) AS two_day
    FROM clean
    GROUP BY city_name
),

res AS (
  SELECT
      city_name,
      one_day,
      two_day,
      two_day - one_day AS growth_droop
  FROM city_sales
)

SELECT *
FROM res
ORDER BY growth_droop DESC
LIMIT 1

UNION ALL

SELECT *
FROM res
ORDER BY growth_droop ASC
LIMIT 1;
