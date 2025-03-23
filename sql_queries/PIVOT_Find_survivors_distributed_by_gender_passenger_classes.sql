-- PIVOT USE SUM CASE
-- You can think of it like this:
-- SELECT 
--     grouping_column,
--     SUM(CASE WHEN category_column = 'X' THEN value_column ELSE 0 END) AS X_value,
--     SUM(CASE WHEN category_column = 'Y' THEN value_column ELSE 0 END) AS Y_value,
--     SUM(CASE WHEN category_column = 'Z' THEN value_column ELSE 0 END) AS Z_value
-- FROM table
-- GROUP BY grouping_column;

-- 🧠 How to pivot "manually" in SQL:
-- Identify the row categories to turn into columns → in your case: pclass = 1/2/3.
-- Use CASE WHEN for each category.
-- Wrap each CASE inside an aggregate like SUM() or COUNT().
-- ✅ General rule of thumb:
-- Whenever you want to turn rows into columns, this technique works!

-- select sex, 
-- case 
--     when pclass = 1 then 'first_class'
--     when pclass = 2 then 'second_class'
--     when pclass = 3 then 'third_class'
-- end as pclassific, count(*)
-- from titanic
-- group by sex, pclass;

SELECT 
    sex,
    SUM(CASE WHEN pclass = 1 AND survived = 1 THEN 1 ELSE 0 END) AS first_class,
    SUM(CASE WHEN pclass = 2 AND survived = 1 THEN 1 ELSE 0 END) AS second_class,
    SUM(CASE WHEN pclass = 3 AND survived = 1 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY sex;
