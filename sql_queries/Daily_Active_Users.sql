with daily_count as (select account_id, record_date, count(*) as count_acc
from sf_events
where DATE_FORMAT(record_date, '%Y-%m') = '2021-01'
group by account_id, record_date)

select account_id, record_date, avg(count_acc) as avg_daily_count
from daily_count
group by account_id;
