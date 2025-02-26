select hotel_name, count(*) as cnts
from hotel_reviews
where negative_review <> 'No Negative'
group by hotel_name
order by cnts desc
limit 2;
