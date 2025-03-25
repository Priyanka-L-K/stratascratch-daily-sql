select (sum(case when ts_accepted_at is not null then 1 else 0 end)/count(*)) * 100
from airbnb_contacts;
