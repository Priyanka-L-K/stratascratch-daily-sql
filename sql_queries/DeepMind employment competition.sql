select gcp.team_id, avg(gcs.member_score) as avg_score
from google_competition_participants as gcp
inner join google_competition_scores as gcs
on gcp.member_id = gcs.member_id
group by gcp.team_id
order by avg_score desc;
