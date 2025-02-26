-- DATE_FORMAT()
-- EXTRACT(YEAR_MONTH from order_date)
select DATE_FORMAT(order_date, '%Y-%m') as month_year, sum(order_value) as monthly_yearly_sales 
from fct_customer_sales
group by month_year 
order by monthly_yearly_sales desc
limit 3;
