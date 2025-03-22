select trackname, count(*) as times_top
from spotify_worldwide_daily_song_ranking
where position = 1
group by trackname
order by times_top desc;
