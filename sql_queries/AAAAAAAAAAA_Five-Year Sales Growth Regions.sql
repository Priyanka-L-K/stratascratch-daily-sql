WITH consecutive_sales AS (
    SELECT 
        region_name, 
        year, 
        tot_sales AS cur_year_sales,
        LAG(tot_sales, 1) OVER (PARTITION BY region_name ORDER BY year) AS prev_year_sales
    FROM (
        SELECT 
            region_name, 
            year, 
            SUM(sales) AS tot_sales
        FROM regional_sales
        GROUP BY region_name, year
    ) AS derived_table
),
growth_flagged AS (
    SELECT 
        region_name,
        year,
        cur_year_sales,
        prev_year_sales,
        CASE WHEN cur_year_sales > prev_year_sales THEN 1 ELSE 0 END AS is_growth
    FROM consecutive_sales
    WHERE prev_year_sales IS NOT NULL
),
with_break_counter AS (
    SELECT
        region_name,
        year,
        is_growth,
        -- running counter: increases by 1 every time growth = 0
        SUM(CASE WHEN is_growth = 0 THEN 1 ELSE 0 END) 
            OVER (PARTITION BY region_name ORDER BY year ROWS UNBOUNDED PRECEDING) AS break_counter
    FROM growth_flagged
)
SELECT 
    region_name,
    MIN(year) AS start_year,
    COUNT(*) AS streak_length
FROM with_break_counter
WHERE is_growth = 1
GROUP BY region_name, break_counter
HAVING COUNT(*) >= 5
ORDER BY region_name, start_year;
