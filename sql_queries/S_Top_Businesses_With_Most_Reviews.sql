-- no aggregation in dense_rank so no precompute count() before dense_rank and no group by clause

select name, review_count
from (select name, review_count, dense_rank() over (order by review_count desc) as d_r
from yelp_business) as cnts
where d_r <= 5;
