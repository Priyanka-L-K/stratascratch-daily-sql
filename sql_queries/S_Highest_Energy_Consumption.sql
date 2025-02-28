-- I considered inner join which is wrong in this case because our main objective is to find total consumption across all regions 
-- they didnt specify that all days were recorded so we need to use either **FULL OUTER JOIN or UNION ALL**

select date(date) as date, 
case when date then eu_con + asia_con + n_con end as total
from (select date(f_e.date) as date, f_e.consumption as eu_con, f_a.consumption as asia_con, f_n.consumption as n_con
from fb_eu_energy as f_e
inner join fb_asia_energy as f_a
on date(f_e.date) = date(f_a.date)
inner join fb_na_energy as f_n
on date(f_e.date) = date(f_n.date)
group by f_e.date) as joined_tables
order by total desc

-- It is
WITH combined_energy AS (
    SELECT DATE(date) AS energy_date, SUM(consumption) AS total_energy, dense_rank() over(order by SUM(consumption) desc) as rn
    FROM (
        SELECT date, consumption FROM fb_eu_energy
        UNION ALL
        SELECT date, consumption FROM fb_asia_energy
        UNION ALL
        SELECT date, consumption FROM fb_na_energy
    ) AS all_energy
    GROUP BY energy_date
)

SELECT energy_date, total_energy
FROM combined_energy
where rn = 1
ORDER BY total_energy DESC;
