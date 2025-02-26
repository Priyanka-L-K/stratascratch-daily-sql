My answer

select DAYNAME(customer_placed_order_datetime) as day_of_week, HOUR(customer_placed_order_datetime) as hour_day, round(avg(order_total - discount_amount + tip_amount - refunded_amount), 2) as net_order_total
from doordash_delivery
group by day_of_week, hour_day
order by field(day_of_week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'), hour_day;
