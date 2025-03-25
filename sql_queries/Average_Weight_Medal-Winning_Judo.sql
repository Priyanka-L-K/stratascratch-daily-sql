select team, avg(weight) 
from olympics_athletes_events
where age between 20 and 30 and medal is not null and weight is not null
group by team;
