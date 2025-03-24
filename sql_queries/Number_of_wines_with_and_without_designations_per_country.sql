select country, 
sum(case when designation is NOT NULL then 1 else 0 end) as with_designation,
sum(case when designation is NULL then 1 else 0 end) as without_designation,
count(*) as `both`
from winemag_p2
group by country;
