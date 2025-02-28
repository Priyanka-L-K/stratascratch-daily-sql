SELECT
    MONTH(order_date) AS order_month,
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
FROM
    uber_orders
WHERE
    status_of_order = 'Completed'
GROUP BY
    MONTH(order_date)
ORDER BY
    order_month;
