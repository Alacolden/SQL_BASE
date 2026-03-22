WITH date_series AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date AS date
)
SELECT 
    date AS missing_date
FROM date_series
WHERE date NOT IN (
    SELECT visit_date 
    FROM person_visits 
    WHERE person_id IN (1, 2)
)
ORDER BY missing_date;