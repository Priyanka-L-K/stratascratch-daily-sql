SELECT 
    ROUND(SUM(CASE WHEN end_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 4) AS churn_rate
FROM lyft_drivers;


-- I am a liitle confused with what they are asking? like per year churn rate or across all years, if it is per year then should i consider start_date or end_date as group by ?
