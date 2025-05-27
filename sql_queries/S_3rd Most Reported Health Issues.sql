WITH filtered AS (
    SELECT *
    FROM los_angeles_restaurant_health_inspections
    WHERE LOWER(facility_name) REGEXP 'cafe|tea|juice'
),

ranked_pe AS (
    SELECT 
        pe_description,
        COUNT(*) AS freq,
        DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM filtered
    GROUP BY pe_description
),

third_ranked AS (
    SELECT pe_description
    FROM ranked_pe
    WHERE rnk = 3
)

SELECT f.facility_name, f.pe_description
FROM filtered f
JOIN third_ranked t
ON f.pe_description = t.pe_description;
