select count(*)
from airbnb_hosts as ah
inner join airbnb_apartments as aa
on ah.host_id = aa.host_id
where ah.nationality != aa.country;
