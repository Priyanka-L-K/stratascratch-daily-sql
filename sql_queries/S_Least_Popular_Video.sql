WITH ranked_videos AS (
    SELECT 
        video_id, 
        DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT user_id) ASC) AS rnk
    FROM videos_watched
    GROUP BY video_id
)
SELECT video_id
FROM ranked_videos
WHERE rnk = 1;
