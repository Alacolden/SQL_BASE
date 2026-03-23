COMMENT ON TABLE person_discounts IS 'таблица с персональными скидками в каждой пиццерии';
COMMENT ON COLUMN person_discounts.id IS 'технический id каждой скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'технический id человека из таблицы person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'технический id пиццирий из таблицы pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'персональная скидка в процентах в зависемости от колличества заказов';