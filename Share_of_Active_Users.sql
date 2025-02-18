My answer:

with total as (select count(*) as t
from fb_active_users
where country = 'USA'),

open as (select count(*) as o
from fb_active_users
where country = 'USA' and status = 'open')

select round(o/t * 100, 2)
from total, open;

Optimized chatGPT
  SELECT 
    (COUNT(CASE WHEN status = 'open' AND country = 'USA' THEN 1 END) * 100.0) / COUNT(*) AS active_user_share
FROM 
    users;
