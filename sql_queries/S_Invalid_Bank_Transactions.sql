-- used dayofweek instead of dayname

select transaction_id
from boi_transactions
where dayname(time_stamp) in ('Saturday', 'Sunday') or hour(time_stamp) not between 9 and 16 or date_format(time_stamp, '%m-%d') in ('12-25', '12-26');
