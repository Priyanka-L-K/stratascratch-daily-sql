When you do WHERE points >= 90, you're removing all rows below 90 upfront.
BUT... this isn't exactly what the question wants.

🧠 The key is this part of the question:
"...in each row for the winery, variety pair, number of points should be at least 90..."

-- ✅ What they mean:
-- They want you to evaluate ALL rows for each winery + variety pair, even those with points less than 90, and eliminate the entire pair if even one row has less than 90.

-- ❌ What happens when you filter early with WHERE:
-- You already throw out rows below 90 before grouping.

-- This means you might still include a "partial" pair that looks valid after filtering but actually isn’t.

-- ✅ Example:
-- winery	variety	points
-- Winery A	Merlot	95
-- Winery A	Merlot	85
-- Winery B	Syrah	91
-- If you do WHERE points >= 90:
-- Winery A's 95-point Merlot row stays and gets summed.

-- But Winery A's Merlot should be excluded entirely because it had a row with only 85 points!

-- ✅ Correct logic:
-- Group by winery + variety

-- Check the minimum points across all rows.

-- If MIN(points) >= 90, it's a valid pair.

-- If MIN(points) < 90, drop the whole pair.

-- ✅ This is why we move the filter to HAVING MIN(points) >= 90
-- 👉 AFTER grouping instead of doing WHERE points >= 90 upfront!







SELECT 
    winery, 
    variety, 
    SUM(price) AS total_revenue
FROM winemag_p1
GROUP BY winery, variety
HAVING MIN(points) >= 90
ORDER BY winery ASC, total_revenue DESC;
