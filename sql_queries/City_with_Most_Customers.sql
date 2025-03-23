with ranked_cities as (select lo.city, count(*) as cnt, dense_rank() over (order by count(*) desc) as rn
from lyft_orders as lo
inner join lyft_payments as lp
on lo.order_id = lp.order_id
where date_format(lp.order_date, '%Y-%m') = '2021-08' and lp.promo_code = 0
group by lo.city)

select city
from ranked_cities
where rn = 1;
