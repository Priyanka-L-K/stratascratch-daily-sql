WITH extraction AS (
    SELECT 
        invoicedate,
        quantity,
        unitprice, 
        EXTRACT(WEEK FROM invoicedate) AS week_number, 
        DAYNAME(invoicedate) AS day_of_week,
        (quantity * unitprice) AS total_sale
    FROM early_sales
),

weekly_sales AS (
    SELECT 
        week_number,
        SUM(total_sale) AS week_total
    FROM extraction
    GROUP BY week_number
),

monday_sunday_sales AS (
    SELECT 
        week_number,
        SUM(CASE WHEN day_of_week = 'Monday' THEN total_sale ELSE 0 END) AS monday_total,
        SUM(CASE WHEN day_of_week = 'Sunday' THEN total_sale ELSE 0 END) AS sunday_total
    FROM extraction
    GROUP BY week_number
)

SELECT 
    ws.week_number,
    ROUND(100 * ms.monday_total / ws.week_total) AS monday_percentage,
    ROUND(100 * ms.sunday_total / ws.week_total) AS sunday_percentage
FROM weekly_sales ws
JOIN monday_sunday_sales ms ON ws.week_number = ms.week_number
ORDER BY ws.week_number;
