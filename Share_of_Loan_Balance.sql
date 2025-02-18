My Answer:

with t as (select rate_type, sum(balance) as total_balance
from submissions
group by rate_type)

select s.rate_type, s.loan_id, s.balance, round(s.balance/t.total_balance * 100, 2) as percentage
from submissions as s
join t
on s.rate_type = t.rate_type;


Optimized by chatGPT
SELECT 
    rate_type,
    loan_id,
    balance,
    (balance / SUM(balance) OVER (PARTITION BY rate_type) * 100) AS balance_percentage
FROM 
    submissions;
