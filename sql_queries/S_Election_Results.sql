#didnt understand anything wrote something

with voter_share as (select candidate, round(1 / count(*) over (partition by voter), 2) as vote_share 
from voting_results
where voter is not null and voter != ''),

total_vote as (select candidate, sum(vote_share) as total 
from voter_share) 

select candidate
from total_vote
