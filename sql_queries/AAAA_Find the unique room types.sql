WITH RECURSIVE split_room_types AS (
    SELECT
        id_user, -- if your table has a primary key
        TRIM(SUBSTRING_INDEX(filter_room_types, ',', 1)) AS room_type,
        SUBSTRING(filter_room_types, LENGTH(SUBSTRING_INDEX(filter_room_types, ',', 1)) + 2) AS rest
    FROM airbnb_searches

    UNION ALL

    SELECT
        id_user,
        TRIM(SUBSTRING_INDEX(rest, ',', 1)) AS room_type,
        SUBSTRING(rest, LENGTH(SUBSTRING_INDEX(rest, ',', 1)) + 2)
    FROM split_room_types
    WHERE rest <> ''
)

SELECT DISTINCT room_type
FROM split_room_types
WHERE room_type <> '';
