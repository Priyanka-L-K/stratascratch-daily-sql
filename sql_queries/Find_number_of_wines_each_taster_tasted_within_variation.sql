select taster_name, variety, count(*) as cnts
from winemag_p2
where taster_name is not null
group by taster_name, variety
order by taster_name asc, variety asc, cnts desc;
