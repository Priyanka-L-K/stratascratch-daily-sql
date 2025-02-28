-- my interpretation of the question but its so different i am not able to understand it

with collected_date as (select date, 
sum(case when `action` = 'sent' then 1 else 0 end) as no_sent,
sum(case when `action` = 'accepted' then 1 else 0 end) as no_accepted
from fb_friend_requests
group by date(date))

select date(date) as date, CAST(no_accepted / NULLIF(no_sent, 0) AS DECIMAL(10,4))
from collected_date
-- where no_sent > 0
order by date(date);
