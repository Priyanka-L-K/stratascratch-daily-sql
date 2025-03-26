-- timestampdiff(par -> minute, hour, day, a1, a2)

-- My answer:
select date_format(order_placed_time, '%Y-%m'), 
sum(case when timestampdiff(minute, predicted_delivery_time, actual_delivery_time) > 20 then 1 else 0 end) * 100/count(*)
from delivery_orders
group by date_format(order_placed_time, '%Y-%m');

optimized:
SELECT 
    DATE_FORMAT(order_placed_time, '%Y-%m') AS order_month, 
    ROUND(
        SUM(CASE 
            WHEN TIMESTAMPDIFF(MINUTE, predicted_delivery_time, actual_delivery_time) > 20 THEN 1 
            ELSE 0 
        END) / COUNT(*) * 100, 2
    ) AS late_percentage
FROM delivery_orders
GROUP BY order_month;
