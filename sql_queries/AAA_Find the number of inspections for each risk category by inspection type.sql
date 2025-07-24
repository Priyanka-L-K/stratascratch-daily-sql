SELECT
    inspection_type,
    COUNT(*) AS total_inspections,
    COUNT(CASE 
        WHEN TRIM(risk_category) = 'High Risk' THEN 1 
    END) AS high_risk,
    COUNT(CASE 
        WHEN TRIM(risk_category) = 'Moderate Risk' THEN 1 
    END) AS moderate_risk,
    COUNT(CASE 
        WHEN TRIM(risk_category) = 'Low Risk' THEN 1 
    END) AS low_risk,
    COUNT(CASE 
        WHEN risk_category IS NULL OR TRIM(risk_category) = '' THEN 1 
    END) AS no_risk
FROM
    sf_restaurant_health_violations
GROUP BY
    inspection_type
ORDER BY
    total_inspections DESC;
