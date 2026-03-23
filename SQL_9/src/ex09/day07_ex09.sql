SELECT
    address,
    formula,
    average,
    CASE WHEN sum.formula > sum.average
            THEN 'true'
            ELSE 'false'
            END AS comparison
FROM (
    SELECT
        address,
        ROUND(MAX(age) - MIN(age)::numeric / MAX(age), 2) AS formula,
        ROUND(AVG(age), 2) AS average
        FROM person
        GROUP BY address
)sum
ORDER BY address;


