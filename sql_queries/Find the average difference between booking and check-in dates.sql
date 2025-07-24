select id_host, avg(timestampdiff(DAY, ts_booking_at, ds_checkin)) as avg_days_between_booking_and_checkin
from airbnb_contacts
where ts_booking_at is not null and ds_checkin is not null
group by id_host
order by avg_days_between_booking_and_checkin desc;
