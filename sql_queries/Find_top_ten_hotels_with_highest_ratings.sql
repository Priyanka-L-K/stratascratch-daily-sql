select hotel_name, avg(reviewer_score) as avg_review
from hotel_reviews
group by hotel_name
order by avg_review desc
limit 10;
