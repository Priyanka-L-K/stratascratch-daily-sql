with group_travel_history as 
(select *, 
row_number() over (partition by traveler order by date asc) as start_date_seq,
row_number() over (partition by traveler order by date desc) as end_date_seq
from travel_history),

first_last_pairs as 
(select traveler,
    MAX(CASE WHEN start_date_seq = 1 THEN start_city END) AS home_city,
    MAX(CASE WHEN end_date_seq = 1 THEN end_city END) AS last_city
from group_travel_history
group by traveler)

select count(*) as travellers_back_in_home
from first_last_pairs
where home_city = last_city
