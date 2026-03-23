SELECT
    p.name,
    m.pizza_name,
    m.price,
    ROUND(m.price * (1 - pd.discount / 100), 2) AS discount_price,
    pz.name AS pizzeeria_name
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_discounts pd ON pz.id = pd.pizzeria_id AND pd.person_id = p.id
ORDER BY p.name, m.pizza_name;