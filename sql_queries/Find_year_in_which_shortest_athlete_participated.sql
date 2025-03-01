select year
from olympics_athletes_events
where height IS NOT NULL
order by height asc
limit 1;
