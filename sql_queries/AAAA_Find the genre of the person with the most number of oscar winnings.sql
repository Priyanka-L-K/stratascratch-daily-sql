WITH oscar_info AS (
    SELECT 
        nom.year, 
        nom.category, 
        nom.nominee, 
        nom.movie, 
        nom.winner, 
        ni.top_genre, 
        ni.birthday
    FROM oscar_nominees AS nom
    INNER JOIN nominee_information AS ni
        ON nom.nominee = ni.name
),

oscar_wins AS (
    SELECT *
    FROM oscar_info
    WHERE winner != 0
),

most_wins AS (
    SELECT 
        nominee, 
        COUNT(*) AS no_of_wins
    FROM oscar_wins
    GROUP BY nominee
    ORDER BY no_of_wins DESC, nominee ASC
    LIMIT 1
)

SELECT DISTINCT top_genre
FROM oscar_info
WHERE nominee = (SELECT nominee FROM most_wins);
