My answer:

select user_id, 
sum(case when session_type = 'streamer' then 1 else 0 end) as streaming,
sum(case when session_type = 'viewer' then 1 else 0 end) as viewing
from twitch_sessions
group by user_id
having streaming > viewing
order by streaming desc, viewing desc
limit 3;
