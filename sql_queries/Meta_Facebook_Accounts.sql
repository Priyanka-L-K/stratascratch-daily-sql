select sum(case when date(date) = '2020-01-10' and status = 'closed' then 1 else 0 end)/sum(case when date(date) = '2020-01-10'then 1 else 0 end)
from fb_account_status;
