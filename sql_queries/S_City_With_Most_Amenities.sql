SELECT city
FROM airbnb_search_details
GROUP BY city
ORDER BY sum(length(amenities)) DESC
LIMIT 1
