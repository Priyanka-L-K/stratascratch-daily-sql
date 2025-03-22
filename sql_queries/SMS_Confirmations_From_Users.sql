with confirm_m as (select count(*) as confirm_t
from fb_sms_sends as fs
inner join fb_confirmers as fc
on fs.phone_number = fc.phone_number
where fs.type = 'message' and date(fc.date) = '2020-08-04'),

total_m as (select count(*) as total_t
from fb_sms_sends as fs
where fs.type = 'message' and date(fs.ds) = '2020-08-04')

select (confirm_m.confirm_t * 1/total_m.total_t) * 100
from confirm_m, total_m;
