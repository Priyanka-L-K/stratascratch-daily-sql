-- lierally was considering the whole thing irrespective of unit_tpe after 20 mins saw we need only apartments

select a_h.nationality, count(distinct unit_id)
from airbnb_hosts as a_h
inner join airbnb_units as a_u
on a_h.host_id = a_u.host_id
where a_h.age < 30 and a_u.unit_type = 'Apartment';
