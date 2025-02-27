-- TIMESTAMPDIFF(second, b, a) b-a

My answer
with page_loads as (select user_id, timestamp, rank() over (partition by user_id, date(timestamp) order by timestamp desc) as most_recent_page_load
from facebook_web_log
where action IN ('page_load')), 

recent_page_loads as (select *
from page_loads
where most_recent_page_load = 1),

page_exits as (select user_id, timestamp, rank() over (partition by user_id, date(timestamp) order by timestamp asc) as most_earliest_page_exit
from facebook_web_log
where action IN ('page_exit')), 

recent_earliest_page_exits as (select *
from page_exits
where most_earliest_page_exit = 1)

-- select r_p_l.user_id, r_p_l.timestamp as page_load_time, e_p_i.timestamp as page_exit_time
select r_p_l.user_id, avg(timestampdiff(second, r_p_l.timestamp, e_p_i.timestamp)) as avg_session_duration
-- select r_p_l.user_id, avg(e_p_i.timestamp - r_p_l.timestamp) as avg_session_time_in_sec
from recent_page_loads as r_p_l
inner join recent_earliest_page_exits as e_p_i
on r_p_l.user_id = e_p_i.user_id and date(r_p_l.timestamp) = date(e_p_i.timestamp) AND r_p_l.timestamp <= e_p_i.timestamp
group by r_p_l.user_id;

Optimized
with 
daily_user_sessions as ( 
    select 
        user_id, 
        date(timestamp) session_date, 
        max(case when lower(action)='page_load' then timestamp end) latest_load,
        min(case when lower(action)='page_exit' then timestamp end) earliest_exit
    from facebook_web_log 
    group by user_id, session_date
)
select user_id, avg(timestampdiff(second, latest_load, earliest_exit)) as avg_session_duration 
from daily_user_sessions 
where latest_load < earliest_exit
group by user_id
