with month_revenue as 
(select date_format(created_at, '%Y-%m') as ym, sum(value) as rev
from sf_transactions
group by ym
order by ym asc)

select ym, (rev - lag(rev) over(order by ym))/ lag(rev) over(order by ym) * 100 as prev_month
from month_revenue;

-- lag() over() gives the previous row value
