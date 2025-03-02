-- using distinct on two columns inside count not one
-- first one works considering there is no null values or missing in either first name or last name
-- second one identifies all edge cases and uses coalesce with space

select video_id, count(distinct concat(user_firstname, user_lastname))
from user_flags
where flag_id is not null
group by video_id;

Optimised
WITH unique_users AS
  (SELECT video_id,
          CONCAT(COALESCE(user_firstname, ''), COALESCE(user_lastname, '')) AS user_identifier
  FROM user_flags
  WHERE flag_id IS NOT NULL)
SELECT video_id,
      COUNT(DISTINCT user_identifier) AS num_unique_users
FROM unique_users
GROUP BY video_id;
