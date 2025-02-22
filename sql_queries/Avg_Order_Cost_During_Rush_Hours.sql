select hour(customer_placed_order_datetime) as orderhour, (order_total + tip_amount - discount_amount + refunded_amount) as gross_order_total
from delivery_details
where delivery_region = 'San Jose' and hour(customer_placed_order_datetime) between 15 and 17
group by hour(customer_placed_order_datetime);
