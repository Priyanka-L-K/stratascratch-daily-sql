My answer

select sum(s_r.exchange_rate * s_a.sales_amount) as sales_amount_in_USD,
case
    when MONTH(s_a.sales_date) in (1, 2, 3) then 1
    when MONTH(s_a.sales_date) in (4, 5, 6) then 2 
    when MONTH(s_a.sales_date) in (7, 8, 9) then 3
    when MONTH(s_a.sales_date) in (10, 11, 12) then 4
end as quarter
from sf_exchange_rate as s_r
inner join sf_sales_amount s_a
on s_r.source_currency = s_a.currency and s_r.date = s_a.sales_date
group by quarter

optimized

SELECT 
    SUM(s_r.exchange_rate * s_a.sales_amount) AS sales_amount_in_USD,
    CASE
        WHEN MONTH(s_a.sales_date) IN (1, 2, 3) THEN 1 
        WHEN MONTH(s_a.sales_date) IN (4, 5, 6) THEN 2 
    END AS quarter
FROM sf_exchange_rate AS s_r
INNER JOIN sf_sales_amount AS s_a
    ON s_r.source_currency = s_a.currency 
    AND s_r.date = s_a.sales_date
WHERE s_a.sales_date BETWEEN '2020-01-01' AND '2020-06-30'  
GROUP BY quarter
ORDER BY quarter;
