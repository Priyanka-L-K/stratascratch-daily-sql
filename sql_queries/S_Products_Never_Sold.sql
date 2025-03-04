-- 🔹 Step 1: Find Categories That Have Been Sold
WITH sold_categories AS (
    SELECT DISTINCT o_p_c.category_id
    FROM online_products AS o_p
    INNER JOIN online_orders AS o_o ON o_p.product_id = o_o.product_id
    INNER JOIN online_product_categories AS o_p_c ON o_p.product_category = o_p_c.category_id
)
-- Joins online_products with online_orders to find products that have been sold.
-- Joins with online_product_categories to get the category of sold products.
-- Uses DISTINCT to ensure each category appears only once (even if multiple products from that category were sold).

🔹 Step 2: Compare Against All Categories

SELECT 
    ROUND(
        (COUNT(DISTINCT o_p_c.category_id) - COUNT(DISTINCT s_c.category_id)) / COUNT(DISTINCT o_p_c.category_id) * 100, 2
    ) AS unsold_category_percentage
FROM online_product_categories AS o_p_c
LEFT JOIN sold_categories AS s_c ON o_p_c.category_id = s_c.category_id;

-- Counts all product categories:

COUNT(DISTINCT o_p_c.category_id) -- This counts all unique categories in the inventory. Counts sold categories:

COUNT(DISTINCT s_c.category_id) -- This counts how many unique categories have sold at least once. Calculates unsold percentage:

(COUNT(DISTINCT o_p_c.category_id) - COUNT(DISTINCT s_c.category_id)) / COUNT(DISTINCT o_p_c.category_id) * 100 -- Finds how many categories have NOT been sold. Divides by total categories to get the percentage.
-- Uses ROUND(..., 2) to show the result with two decimal places.


-- select category_id
-- from online_product_categories
-- where category_id not in (select o_p_c.category_id
-- from online_products as o_p
-- inner join online_orders as o_o
-- on o_p.product_id = o_o.product_id
-- inner join online_product_categories as o_p_c
-- on o_p.product_category = o_p_c.category_id
-- group by o_p.product_id, o_p_c.category_id
-- order by count(o_o.units_sold) asc);

WITH sold_categories AS (
    SELECT DISTINCT o_p_c.category_id
    FROM online_products AS o_p
    INNER JOIN online_orders AS o_o ON o_p.product_id = o_o.product_id
    INNER JOIN online_product_categories AS o_p_c ON o_p.product_category = o_p_c.category_id
)

SELECT 
    ROUND(
        (COUNT(DISTINCT o_p_c.category_id) - COUNT(DISTINCT s_c.category_id)) / COUNT(DISTINCT o_p_c.category_id) * 100, 2
    ) AS unsold_category_percentage
FROM online_product_categories AS o_p_c
LEFT JOIN sold_categories AS s_c ON o_p_c.category_id = s_c.category_id;
