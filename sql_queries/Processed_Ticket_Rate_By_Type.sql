SELECT 
    type, 
    ROUND(SUM(CASE WHEN processed = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS processed_rate
FROM facebook_complaints
GROUP BY type;
