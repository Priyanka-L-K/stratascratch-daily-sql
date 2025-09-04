with host_info as
(select year(host_since) as year, count(*) as no_of_hosts
from airbnb_search_details
group by year(host_since)
order by year(host_since) asc),

info_growth_rate as (
select year, no_of_hosts as cur_no_of_hosts, LAG(no_of_hosts, 1) OVER (ORDER BY year) AS prev_no_of_hosts
from host_info)

select year, cur_no_of_hosts, prev_no_of_hosts, round(((cur_no_of_hosts-prev_no_of_hosts)*1.0/prev_no_of_hosts) * 100,0) as growth_rate
from info_growth_rate
WHERE prev_no_of_hosts IS NOT NULL
order by year;
