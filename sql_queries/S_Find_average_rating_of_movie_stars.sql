-- coalsece

-- My answer

select n_f.name, n_i.birthday, avg(rating) as avg_rating
from nominee_filmography as n_f
inner join nominee_information as n_i
on n_f.name = n_i.name
group by n_f.name, n_i.birthday
order by n_i.birthday;


-- Optimized

SELECT 
    n_f.name, 
    n_i.birthday, 
    AVG(COALESCE(n_f.rating, 0)) AS avg_rating
FROM nominee_filmography AS n_f
INNER JOIN nominee_information AS n_i
    ON n_f.name = n_i.name
GROUP BY n_f.name, n_i.birthday
ORDER BY n_i.birthday IS NULL, n_i.birthday ASC;
