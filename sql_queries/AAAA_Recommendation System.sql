-- WITH friend_pairs AS (
--     SELECT user_id, friend_id
--     FROM users_friends
-- ),

-- users_friends_pages as (
-- SELECT 
--     friend_pairs.user_id AS original_user, 
--     up.page_id AS friend_page
-- FROM friend_pairs
-- JOIN users_pages as up
--   ON friend_pairs.friend_id = up.user_id)
  
-- select original_user, users_friends_pages.friend_page
-- from users_friends_pages
-- where users_friends_pages.friend_page not in (select page_id from users_pages where user_id = original_user);

WITH friend_pages AS (
    SELECT 
        uf.user_id AS user_id, 
        up.page_id AS page_id
    FROM users_friends uf
    JOIN users_pages up 
      ON uf.friend_id = up.user_id
),

filtered_recommendations AS (
    SELECT 
        fp.user_id, 
        fp.page_id
    FROM friend_pages fp
    WHERE NOT EXISTS (
        SELECT 1 
        FROM users_pages up
        WHERE up.user_id = fp.user_id
          AND up.page_id = fp.page_id
    )
),

page_counts AS (
    SELECT 
        user_id,
        page_id,
        COUNT(*) AS friend_count
    FROM filtered_recommendations
    GROUP BY user_id, page_id
),

ranked_recommendations AS (
    SELECT 
        user_id,
        page_id,
        friend_count,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY friend_count DESC, page_id) AS ranks
    FROM page_counts
)

SELECT *
FROM ranked_recommendations
-- optional: only top 3 per user
-- WHERE rank <= 3
ORDER BY user_id, ranks;
