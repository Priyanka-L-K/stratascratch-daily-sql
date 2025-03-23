select distinct name, (case when team regexp '/' then 'Multiple Teams' else 'One Team' end) as classification
from olympics_athletes_events;

-- select distinct name, (case when team like '%/%' then 'Multiple Teams' else 'One Team' end) as classification
-- from olympics_athletes_events;
