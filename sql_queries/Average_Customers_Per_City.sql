with city_custo as (select l_ci.city_name, l_co.country_name, count(*) as customers_per_city
from linkedin_customers as l_c
join linkedin_city as l_ci
on l_c.city_id = l_ci.id
join linkedin_country as l_co
on l_ci.country_id = l_co.id
group by l_ci.city_name, l_co.country_name)

select city_name, country_name, customers_per_city
from city_custo
where customers_per_city > (select avg(customers_per_city) from city_custo where customers_per_city >= 1);
