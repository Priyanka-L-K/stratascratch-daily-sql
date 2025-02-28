-- had few hiccups while setting date boundaries

WITH customers_at_start AS (
    SELECT COUNT(*) AS f_in_month
    FROM natera_subscriptions
    WHERE contract_start <= '2021-09-01' 
      AND (contract_end > '2021-09-01' OR contract_end IS NULL)
),
customers_at_end AS (
    SELECT COUNT(*) AS l_in_month
    FROM natera_subscriptions
    WHERE contract_start <= '2021-09-30' 
      AND (contract_end > '2021-09-30' OR contract_end IS NULL)
)

SELECT 
    ROUND((c_start.f_in_month - c_end.l_in_month) / c_start.f_in_month * 100, 2) AS churn_rate_percentage
FROM customers_at_start c_start, customers_at_end c_end;
