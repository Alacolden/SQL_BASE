SELECT object_name
FROM (
    SELECT name AS object_name
    FROM person
    UNION ALL
    SELECT pizza_name AS object_name
    FROM menu
) AS combined_data
ORDER BY 
    CASE 
        WHEN object_name IN (SELECT name FROM person) THEN 0
        ELSE 1
    END,
    object_name;