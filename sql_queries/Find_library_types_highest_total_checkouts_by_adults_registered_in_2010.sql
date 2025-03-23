SELECT 
    year_patron_registered, 
    home_library_definition, 
    SUM(total_checkouts) AS total_checkouts
FROM library_usage
WHERE patron_type_definition = 'ADULT' 
  AND year_patron_registered = 2010
GROUP BY year_patron_registered, home_library_definition
ORDER BY total_checkouts DESC
LIMIT 1;
