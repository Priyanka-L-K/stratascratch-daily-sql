-- PostgreSQL (uses || for string concatenation):

SELECT 
  'A' AS grade, 
  MIN(score) AS min_score, 
  MAX(score) AS max_score,
  'Score > ' || MIN(score) || ' AND Score <= ' || MAX(score) || ' => Grade = A' AS rule
FROM los_angeles_restaurant_health_inspections
WHERE grade = 'A'

UNION ALL

SELECT 
  'B' AS grade, 
  MIN(score) AS min_score,
  MAX(score) AS max_score,
  'Score > ' || MIN(score) || ' AND Score <= ' || MAX(score) || ' => Grade = B' AS rule
FROM los_angeles_restaurant_health_inspections
WHERE grade = 'B'

UNION ALL

SELECT 
  'C' AS grade, 
  MIN(score) AS min_score, 
  MAX(score) AS max_score,
  'Score > ' || MIN(score) || ' AND Score <= ' || MAX(score) || ' => Grade = C' AS rule
FROM los_angeles_restaurant_health_inspections
WHERE grade = 'C';

-- If you're using MySQL, replace || with CONCAT():
SELECT 
  'A' AS grade, 
  MIN(score) AS min_score, 
  MAX(score) AS max_score,
  CONCAT('Score > ', MIN(score), ' AND Score <= ', MAX(score), ' => Grade = A') AS rule
