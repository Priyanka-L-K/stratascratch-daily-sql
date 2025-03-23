-- DOW, DAYNAME

SELECT 
    dayname(ds_checkin) AS day_of_week, 
    COUNT(*) AS total_bookings
FROM airbnb_contacts
GROUP BY day_of_week
ORDER BY day_of_week
