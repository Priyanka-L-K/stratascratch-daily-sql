select lower(jt.word), count(*) as occurrences
from google_file_store as g
join JSON_TABLE(
concat('["', replace(
                    regexp_replace(g.contents, '[[:punct:]]', ''),
            ' ', '","'), 
        '"]'),
'$[*]'
columns(word varchar(200) path '$')) as jt
group by lower(jt.word)
order by occurrences desc;


-- 1. REGEXP_REPLACE()
-- Purpose: Removes (or replaces) parts of a string using a regular expression.
-- Syntax:
-- REGEXP_REPLACE(string, pattern, replacement)
-- Example:
-- REGEXP_REPLACE('Hello, world!', '[[:punct:]]', '')
-- -- Result: 'Hello world'
  
-- 2. REPLACE()
-- Purpose: Replaces all instances of a substring with another.
-- Syntax:
-- REPLACE(original_string, search_string, replace_string)
-- Example:
-- REPLACE('a b c', ' ', '-')
-- -- Result: 'a-b-c'
  
-- 3. CONCAT()
-- Purpose: Combines multiple strings into one.
-- Syntax:
-- CONCAT(string1, string2, ..., stringN)
-- Example:
-- CONCAT('a', 'b', 'c')
-- -- Result: 'abc'
  
-- 4. JSON_TABLE()
-- Purpose: Turns a JSON array into a virtual table (rows from array items).
-- Syntax:
-- JSON_TABLE(
--   json_string,
--   '$[*]'
--   COLUMNS (
--     column_name datatype PATH '$'
--   )
-- )
-- Example:
-- JSON_TABLE('["cat","dog"]', '$[*]'
--   COLUMNS (word VARCHAR(100) PATH '$')
-- )
  
-- Returns:
-- word
-- cat
-- dog
