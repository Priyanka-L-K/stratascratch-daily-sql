-- WITH latest_year AS (
--     SELECT MAX(year) AS most_recent_year
--     FROM billboard_top_100_year_end
-- ),

-- twenty_years_data AS (
--     SELECT b.*
--     FROM billboard_top_100_year_end b
--     JOIN latest_year l ON 1=1
--     WHERE l.most_recent_year - b.year <= 19
-- )

-- SELECT 
--     artist, 
--     COUNT(*) AS appearance_count
-- FROM 
--     twenty_years_data
-- GROUP BY 
--     artist
-- ORDER BY 
--     appearance_count DESC;


-- MORE EFFECIENT

SELECT artist, COUNT(*) AS entry_count
FROM billboard_top_100_year_end
WHERE year >= (
    SELECT MAX(year) - 19
    FROM billboard_top_100_year_end
)
GROUP BY artist
ORDER BY entry_count DESC;


-- had used
-- 1. timestampdiff -> did not work because the year column is 
-- integer and not dates or timestampdiff
