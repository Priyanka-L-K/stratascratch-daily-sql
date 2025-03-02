-- using coalesce may skew result because if ratings are missing then 0 is used which is not right
-- so using left join so movies without ratings don't affect average

-- My answer

select n_i.name, n_i.birthday, avg(coalesce(n_f.rating, 0)) as ratings
from nominee_filmography as n_f
inner join nominee_information as n_i
on n_f.name = n_i.name
group by n_i.name,  n_i.birthday
order by n_i.birthday;

Optimized

SELECT 
    n_i.name, 
    n_i.birthday, 
    AVG(n_f.rating) AS avg_rating
FROM nominee_information AS n_i
LEFT JOIN nominee_filmography AS n_f
    ON n_i.name = n_f.name
GROUP BY n_i.name, n_i.birthday
ORDER BY n_i.birthday ASC;
