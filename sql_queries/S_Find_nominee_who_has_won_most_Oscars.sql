-- precompute count(*) and then use dense rank with no partition 
-- by because we are using aggregation in order by then use group by clause

with rank_nominees as 
(select nominee, count(*) as cnts,
dense_rank() over (order by count(*) desc) as d_r
from oscar_nominees
where winner = 1
group by nominee)

select nominee, cnts
from rank_nominees
where d_r = 1;
