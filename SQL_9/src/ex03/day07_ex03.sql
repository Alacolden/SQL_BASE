SELECT t1.name,
          coalesce(t1.count, 0) + coalesce(t2.count, 0) AS total_count
    FROM
      (SELECT p.name,
              count(*) AS "count"
      FROM person_visits
      INNER JOIN pizzeria p ON p.id = person_visits.pizzeria_id
      GROUP BY p.name) AS t1
    FULL  JOIN
      (SELECT p.name,
              count(*) AS "count"
      FROM person_order
      INNER JOIN menu m ON person_order.menu_id = m.id
      INNER JOIN pizzeria p ON m.pizzeria_id = p.id
      GROUP BY p.name) AS t2 ON t1.name = t2.name
    ORDER BY 2 DESC, 1 ASC;