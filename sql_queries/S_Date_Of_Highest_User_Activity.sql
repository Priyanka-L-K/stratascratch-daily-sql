-- count(distinct ..)

SELECT 
    DATE_FORMAT(date_visited, '%Y-%m-%d') AS day,
    COUNT(DISTINCT user_id) AS num_users
FROM user_streaks
WHERE DATE_FORMAT(date_visited, '%Y-%m-%d') BETWEEN '2022-08-01' AND '2022-08-07'
GROUP BY day
ORDER BY num_users DESC
LIMIT 2;
