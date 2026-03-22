WITH person_ids AS (
    SELECT id as person_id, ROW_NUMBER() OVER (ORDER BY id) as rn
    FROM person
),
current_max AS (
    SELECT COALESCE(MAX(id), 0) as max_id FROM person_order
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    cm.max_id + pi.rn,
    pi.person_id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM person_ids pi
CROSS JOIN current_max cm;