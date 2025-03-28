-- it's giving null

SELECT DISTINCT sport
FROM olympics_athletes_events
WHERE weight IS NOT NULL
  AND height IS NOT NULL
  AND (weight / (height * height)) > 30;
