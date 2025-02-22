with total_rdrs as (select service_name, count(*) as total,
sum(case 
    when status_of_order not in ('Cancelled', 'Completed') then 1 else 0
end) as incomplete_rdrs,
sum(monetary_value) as total_re,
sum(case
    when status_of_order not in ('Cancelled', 'Completed') then monetary_value else 0
end) as loss_re
from uber_orders
group by service_name)

SELECT 
    service_name,
    ROUND((incomplete_rdrs / total) * 100, 2) AS percentage_of_incomplete_orders,
    ROUND((loss_re / total_re) * 100, 2) AS revenue_loss_percentage
FROM total_rdrs
ORDER BY revenue_loss_percentage DESC;
