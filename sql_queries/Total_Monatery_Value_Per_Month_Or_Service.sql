-- Use a format that includes the year. Example:

-- For MySQL: DATE_FORMAT(order_date, '%Y-%m')
-- For PostgreSQL: TO_CHAR(order_date, 'YYYY-MM')
-- For SQL Server: FORMAT(order_date, 'yyyy-MM')

-- MySQL

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,  -- Fixes month grouping issue
    SUM(CASE WHEN service_name = 'Uber_BOX' THEN monetary_value ELSE 0 END) AS Uber_BOX,
    SUM(CASE WHEN service_name = 'Uber_CLEAN' THEN monetary_value ELSE 0 END) AS Uber_CLEAN,
    SUM(CASE WHEN service_name = 'Uber_FOOD' THEN monetary_value ELSE 0 END) AS Uber_FOOD,
    SUM(CASE WHEN service_name = 'Uber_GLAM' THEN monetary_value ELSE 0 END) AS Uber_GLAM,
    SUM(CASE WHEN service_name = 'Uber_MART' THEN monetary_value ELSE 0 END) AS Uber_MART,
    SUM(CASE WHEN service_name = 'Uber_MASSAGE' THEN monetary_value ELSE 0 END) AS Uber_MASSAGE,
    SUM(CASE WHEN service_name = 'Uber_RIDE' THEN monetary_value ELSE 0 END) AS Uber_RIDE,
    SUM(CASE WHEN service_name = 'Uber_SEND' THEN monetary_value ELSE 0 END) AS Uber_SEND,
    SUM(CASE WHEN service_name = 'Uber_SHOP' THEN monetary_value ELSE 0 END) AS Uber_SHOP,
    SUM(CASE WHEN service_name = 'Uber_TIX' THEN monetary_value ELSE 0 END) AS Uber_TIX
FROM uber_orders
WHERE status_of_order = 'Completed'
GROUP BY order_month
ORDER BY order_month;

-- PostgreSQL

SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS order_month,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_BOX') AS Uber_BOX,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_CLEAN') AS Uber_CLEAN,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_FOOD') AS Uber_FOOD,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_GLAM') AS Uber_GLAM,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_MART') AS Uber_MART,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_MASSAGE') AS Uber_MASSAGE,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_RIDE') AS Uber_RIDE,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_SEND') AS Uber_SEND,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_SHOP') AS Uber_SHOP,
    SUM(monetary_value) FILTER (WHERE service_name = 'Uber_TIX') AS Uber_TIX
FROM uber_orders
WHERE status_of_order = 'Completed'
GROUP BY order_month
ORDER BY order_month;

-- SQL Server

SELECT *
FROM (
    SELECT 
        FORMAT(order_date, 'yyyy-MM') AS order_month,
        service_name,
        monetary_value
    FROM uber_orders
    WHERE status_of_order = 'Completed'
) src
PIVOT (
    SUM(monetary_value) 
    FOR service_name IN (
        [Uber_BOX], [Uber_CLEAN], [Uber_FOOD], [Uber_GLAM], 
        [Uber_MART], [Uber_MASSAGE], [Uber_RIDE], 
        [Uber_SEND], [Uber_SHOP], [Uber_TIX]
    )
) pvt
ORDER BY order_month;
