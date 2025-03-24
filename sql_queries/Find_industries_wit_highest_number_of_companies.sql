select industry, count(company) as cnt
from forbes_global_2010_2014
group by industry
order by cnt desc;
