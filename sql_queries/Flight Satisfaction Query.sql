with average_rating as
(select sr.class, round(avg(sr.satisfaction), 0) as average_per_class, dense_rank() over(order by round(avg(sr.satisfaction), 0) desc) as ranks
from survey_results as sr
inner join loyalty_customers as lc
on sr.cust_id = lc.cust_id
where lc.age between 30 and 40
group by sr.class)

select class, average_per_class
from average_rating
where ranks = 1;
