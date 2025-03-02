-- again made rookie mistake of not using all columns used in select in group by so keep in mind

select year_patron_registered, home_library_definition, sum(total_checkouts) as tots
from library_usage
where year_patron_registered = 2015 and age_range = '65 to 74 years' and circulation_active_month = 'April'
group by year_patron_registered, home_library_definition
order by tots desc;
