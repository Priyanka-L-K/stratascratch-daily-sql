WITH active_users AS (
    SELECT 
        country, 
        COUNT(*) AS c_total
    FROM penetration_analysis
    WHERE DATEDIFF('2024-01-31', last_active_date) <= 30
      AND sessions >= 5
      AND listening_hours >= 10
    GROUP BY country
),

total_users AS (
    SELECT 
        country, 
        COUNT(*) AS t_total
    FROM penetration_analysis
    GROUP BY country
)

SELECT 
    a.country,
    round((a.c_total * 1.0 / t.t_total),2) AS active_user_penetration_rate
FROM active_users a
JOIN total_users t
    ON a.country = t.country
ORDER BY a.country;
