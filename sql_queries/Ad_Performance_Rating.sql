select product_id, sum(quantity) as total_quantity,
case 
    when sum(quantity) > 30 then 'Outstanding'
    when sum(quantity) between 20 and 29 then 'Satisfactory'
    when sum(quantity) between 10 and 19 then 'Unsatisfactory'
    when sum(quantity) between 1 and 9 then 'Poor'
end as ad_performance
from marketing_campaign
group by product_id
order by total_quantity desc;
