-- still confused


WITH receiving_users AS (
    SELECT 
        day, 
        to_user AS receiving_user, 
        COUNT(DISTINCT to_user) AS re_cnt
    FROM google_gmail_emails
    GROUP BY day, to_user
),
sending_users AS (
    SELECT 
        day, 
        from_user AS sending_user, 
        COUNT(DISTINCT from_user) AS se_cnt
    FROM google_gmail_emails
    GROUP BY day, from_user
)
SELECT e.*
FROM google_gmail_emails e
JOIN (
    SELECT day
    FROM receiving_users
    GROUP BY day
    HAVING COUNT(DISTINCT receiving_user) > (
        SELECT COUNT(DISTINCT sending_user)
        FROM sending_users
        WHERE day = receiving_users.day
    )
) AS days_with_greater_receivers
ON e.day = days_with_greater_receivers.day;
