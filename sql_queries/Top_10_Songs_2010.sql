select distinct song_name, group_name, year_rank
from billboard_top_100_year_end
where year = 2010
order by year_rank
limit 10;
