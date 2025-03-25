SELECT 
    CASE 
        WHEN risk_category IS NULL THEN 'No Risk Category' 
        ELSE risk_category 
    END AS risk_category,
    COUNT(*) as cnt
FROM 
    sf_restaurant_health_violations
GROUP BY risk_category
order by cnt desc
