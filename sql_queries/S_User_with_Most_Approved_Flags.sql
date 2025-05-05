WITH approved_counts AS (
  SELECT 
    CONCAT(uf.user_firstname, ' ', uf.user_lastname) AS full_name,
    COUNT(DISTINCT uf.video_id) AS approved_videos
  FROM user_flags AS uf
  INNER JOIN flag_review AS fr
    ON uf.flag_id = fr.flag_id
  WHERE fr.reviewed_outcome = 'APPROVED'
  GROUP BY full_name
),
ranked_users AS (
  SELECT 
    full_name,
    approved_videos,
    DENSE_RANK() OVER (ORDER BY approved_videos DESC) AS rnk
  FROM approved_counts
)
SELECT 
  full_name
FROM ranked_users
WHERE rnk = 1;
