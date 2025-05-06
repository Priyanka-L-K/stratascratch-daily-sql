-- with page_0 as 
-- (select 0 as left_page_number, NULL as left_title, (select title as right_title from cookbook_titles where page_number = 1) as right_title),

-- left_even as 
-- (select page_number as left_page_number, title as left_title
-- from cookbook_titles
-- where page_number % 2 = 0),

-- right_odd as 
-- (select page_number, title as right_title
-- from cookbook_titles
-- where page_number % 2 != 0),

-- left_even_right_odd_pairs as 
-- (select ep.left_page_number, ep.left_title, rp.right_title
-- from left_even as ep
-- outer join right_odd as rp
-- on ep.left_page_number + 1 = rp.page_number)

-- select * from page_0
-- union all
-- select * from left_even_right_odd_pairs

-- -- left_even_right_odd_pairs as
-- -- (select ec.page_number as left_page_number, ec.title as left_title, oc.title as right_title
-- -- from cookbook_titles as ec
-- -- inner join cookbook_titles as oc
-- -- on ec.page_number+1 = oc.page_number)

WITH RECURSIVE numbers AS (
  SELECT 0 AS n
  UNION ALL
  SELECT n + 2
  FROM numbers
  WHERE n + 2 <= (SELECT MAX(page_number) FROM cookbook_titles)
),

left_pages AS (
    SELECT page_number, title AS left_title
    FROM cookbook_titles
    WHERE page_number % 2 = 0
  ),

right_pages AS (
    SELECT page_number, title AS right_title
    FROM cookbook_titles
    WHERE page_number % 2 = 1
  ),

final_output AS (
    SELECT 
      n AS left_page_number,
      lp.left_title,
      rp.right_title
    FROM numbers
    LEFT JOIN left_pages lp ON lp.page_number = n
    LEFT JOIN right_pages rp ON rp.page_number = n + 1
  )

SELECT * FROM final_output
ORDER BY left_page_number;
