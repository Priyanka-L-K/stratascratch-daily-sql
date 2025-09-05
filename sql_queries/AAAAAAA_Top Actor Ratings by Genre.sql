with genre_count as
(select actor_name, genre, count(*) as no_per_genre, avg(movie_rating) as avg_rating
from top_actors_rating
group by actor_name, genre),

genre_tied as
(select *, dense_rank() over(partition by actor_name order by no_per_genre desc, avg_rating desc) as actor_genre_rank
from genre_count),

final_tab as 
(select actor_name, genre, avg_rating, dense_rank() over(order by avg_rating desc) as actor_rank
from genre_tied
where actor_genre_rank = 1
order by avg_rating desc)

select *
from final_tab
where actor_rank<=3;
