-- first and last scores awarded as a whole

WITH max_score AS (
    SELECT MAX(score) AS highest_score
    FROM los_angeles_restaurant_health_inspections
)

(SELECT activity_date, facility_name, score, grade
FROM los_angeles_restaurant_health_inspections
WHERE score = (SELECT highest_score FROM max_score)
ORDER BY activity_date ASC
LIMIT 1)  -- First occurrence

UNION ALL

(SELECT activity_date, facility_name, score, grade
FROM los_angeles_restaurant_health_inspections
WHERE score = (SELECT highest_score FROM max_score)
ORDER BY activity_date DESC
LIMIT 1); -- Last occurrence


-- Another level - by considering first and last max scores awarded for each facility

WITH max_scores AS (
    -- Get the maximum score per facility
    SELECT 
        facility_id, 
        MAX(score) AS max_score
    FROM los_angeles_restaurant_health_inspections
    GROUP BY facility_id
),

ranked_scores AS (
    -- Rank all inspections by activity_date per facility
    SELECT 
        l.facility_id, 
        l.facility_name,
        l.activity_date, 
        l.score, 
        l.grade,
        RANK() OVER (PARTITION BY l.facility_id ORDER BY l.activity_date ASC) AS first_rank,
        RANK() OVER (PARTITION BY l.facility_id ORDER BY l.activity_date DESC) AS last_rank
    FROM los_angeles_restaurant_health_inspections l
    JOIN max_scores m 
        ON l.facility_id = m.facility_id 
       AND l.score = m.max_score
)

SELECT facility_id, facility_name, activity_date, score, grade
FROM ranked_scores
WHERE first_rank = 1 OR last_rank = 1
ORDER BY facility_id, activity_date;
