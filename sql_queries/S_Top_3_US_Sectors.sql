select sector, avg(`rank`) as avg_rank
from forbes_global_2010_2014
where country = 'United States'
group by sector
order by avg_rank desc
limit 3;

-- USING BACKTICKS `` FOR RANK TO NEGATE ITS KEYWORD FUNCTIONALITY
