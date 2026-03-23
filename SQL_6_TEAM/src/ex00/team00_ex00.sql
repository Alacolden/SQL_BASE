DROP TABLE IF EXISTS edges;
CREATE TABLE edges (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL
);

INSERT INTO edges VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'c', 35),
('c', 'b', 35),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30);

CREATE MATERIALIZED VIEW routes AS
    WITH RECURSIVE paths AS (
        SELECT
            point1 AS start_city,
            point2 AS next_city,
            ARRAY[point1, point2] AS path,
            cost AS total_cost,
            2 AS visited_count
        FROM edges
        WHERE point1 = 'a'

        UNION ALL

        SELECT
            p.start_city,
            e.point2 AS next_city,
            p.path || e.point2,
            p.total_cost + e.cost,
            p.visited_count + 1
        FROM paths p
        JOIN edges e ON p.next_city = e.point1
        WHERE
            NOT e.point2 = ANY(p.path)
            AND p.visited_count < 4
    ),
    full_tours AS (
        SELECT
            total_cost + (
                SELECT cost
                FROM edges
                WHERE point1 = next_city
                AND point2 = start_city
            ) AS total_cost,
            path || start_city AS tour
        FROM paths
        WHERE visited_count = 4
    )
SELECT DISTINCT total_cost, tour
FROM full_tours
ORDER BY total_cost, tour;

SELECT total_cost, tour
FROM routes
WHERE total_cost = (SELECT MIN(total_cost) FROM routes);