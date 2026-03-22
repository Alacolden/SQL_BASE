INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT 
    (SELECT MAX(id) FROM menu) + 1,
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    'sicilian pizza',
    900;