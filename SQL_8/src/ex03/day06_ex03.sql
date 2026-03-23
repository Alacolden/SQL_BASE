CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT p.name,
       pd.discount AS sele
FROM person p
JOIN person_discounts pd ON p.id = pd.person_id
WHERE pd.person_id > 2 AND pd.pizzeria_id = 2;

SET enable_seqscan = ON;