(SELECT p.name,
            count(*) AS "count",
            'visit' AS action_type
    FROM person_visits
    INNER JOIN pizzeria p ON p.id = person_visits.pizzeria_id
    GROUP BY p.name
    ORDER BY 2 DESC
    LIMIT 3)
    UNION
    (SELECT p.name,
            count(*) AS "count",
            'order' AS action_type
    FROM person_order
    INNER JOIN menu m ON person_order.menu_id = m.id
    INNER JOIN pizzeria p ON m.pizzeria_id = p.id
    GROUP BY p.name
    ORDER BY 2 DESC
    LIMIT 3)
    ORDER BY 3, 2 DESC