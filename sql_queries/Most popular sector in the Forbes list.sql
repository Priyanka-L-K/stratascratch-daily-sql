select sector
from (select sector, count(*) as cnt, dense_rank() over (order by count(*) desc) as rn
from forbes_global_2010_2014
group by sector) as de
where rn = 1;
