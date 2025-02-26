WITH hourly_orders_per_day AS (
    SELECT 
        DATE_FORMAT(order_timestamp_utc, '%Y-%m-%d') AS order_day,
        DATE_FORMAT(order_timestamp_utc, '%Y-%m-%d %H') AS hour,
        COUNT(*) AS orders_per_hour
    FROM 
        postmates_orders
    GROUP BY 
        order_day, hour
),
total_orders_per_day AS (
    SELECT 
        order_day,
        SUM(orders_per_hour) AS total_orders_per_day
    FROM 
        hourly_orders_per_day
    GROUP BY 
        order_day
),
average_orders_per_hour AS (
    SELECT 
        order_day,
        total_orders_per_day / 24 AS avg_orders_per_hour
    FROM 
        total_orders_per_day
)
SELECT 
    h.order_day,
    h.hour,
    h.orders_per_hour,
    a.avg_orders_per_hour
FROM 
    hourly_orders_per_day h
JOIN 
    average_orders_per_hour a ON h.order_day = a.order_day
WHERE 
    h.orders_per_hour = (
        SELECT MAX(orders_per_hour)
        FROM hourly_orders_per_day
        WHERE order_day = h.order_day
    )
ORDER BY 
    h.order_day, h.orders_per_hour DESC;
