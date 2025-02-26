My answer:

with r as (select l.user_id, s.balance,
row_number() over (partition by l.user_id order by l.created_at desc) as r
from loans as l
join submissions as s
on l.id = s.loan_id
where l.type = 'Refinance')

select user_id, balance
from r
where r = 1;
