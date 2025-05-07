-- I had some confusion doing the cte user_friends because i was thinking of using join like self join or full outer join but gpt helped by using union all

with user_friends as
(SELECT user1 AS user, COUNT(*) AS friends_count
FROM facebook_friends
GROUP BY user1
UNION ALL
SELECT user2 AS user, COUNT(*) AS friends_count
FROM facebook_friends
GROUP BY user2),
   
friends as ( 
select user, sum(friends_count) as tot_count
from user_friends
group by user
order by user asc),

distinct_users as 
(select count(distinct user) as dist_user
from friends)

select user, tot_count/dist_user * 100
from friends, distinct_users;
