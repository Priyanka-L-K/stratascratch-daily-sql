select college, count(*) as cnt
from nfl_combine
where pickround  != 0
group by college
order by cnt desc;
