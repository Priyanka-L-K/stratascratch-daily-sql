with maxyearcount as
(select year, dense_rank() over (order by count(*)) as ranks
from nfl_combine
group by year)

select year
from maxyearcount
where ranks = 1;
