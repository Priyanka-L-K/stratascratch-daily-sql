Answer

WITH UserClientInteractions AS (
    SELECT
        fe.user_id,  -- Qualify user_id with the table alias (fe for fact_events)
        COUNT(DISTINCT client_id) AS num_clients
    FROM fact_events AS fe  -- Added alias fe
    GROUP BY fe.user_id  -- Qualify here as well
)
SELECT
        fe.client_id,  -- Qualify
        count(distinct fe.user_id) as exclusive_user_cnts      -- Qualify
    FROM fact_events AS fe   -- Alias fe
    JOIN UserClientInteractions uci ON fe.user_id = uci.user_id  -- Qualify in join condition
    WHERE uci.num_clients = 1
    group by fe.client_id;
