-- im considering both times its asking net time

-- with ranks as (select person_name, gun_time as official_start_till_finish, net_time as runner_start_till_finish, (gun_time - net_time) as diff,
-- dense_rank() over (order by (gun_time - net_time) asc) as d_r_slow_start
-- from marathon_male),

-- chris as (select diff
-- from ranks
-- where lower(person_name) = 'Chris Doe'),

-- ten as (select diff
-- from ranks
-- where d_r_slow_start = 10)

-- select abs(ten.diff - chris.diff)
-- from chris, ten

WITH ranks AS (
    SELECT 
        person_name, 
        net_time,
        DENSE_RANK() OVER (ORDER BY net_time ASC) AS d_r_net
    FROM marathon_male
),
chris AS (
    SELECT net_time
    FROM ranks
    WHERE LOWER(person_name) = 'chris doe'
),
tenth AS (
    SELECT net_time
    FROM ranks
    WHERE d_r_net = 10
    limit 1 -- ensures it collects one 10th rank there can be multiple and if so multiple output rows with same value will be present
)

SELECT ABS(chris.net_time - tenth.net_time) AS net_time_difference
FROM chris, tenth;
