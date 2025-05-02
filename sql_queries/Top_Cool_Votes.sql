select business_name, review_text
from (select business_name, review_text, dense_rank() over (order by cool desc) as r
from yelp_reviews) as ranks
where r = 1;
