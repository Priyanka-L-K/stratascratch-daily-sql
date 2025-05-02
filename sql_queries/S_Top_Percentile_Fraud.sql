with pct as (select *,
percent_rank() over (partition by state order by fraud_score desc) as pctl
from fraud_score)

select policy_num, state, claim_cost, fraud_score
from pct
where pctl <= 0.05
