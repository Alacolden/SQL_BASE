SELECT total_cost, tour
FROM routes
WHERE total_cost = (SELECT MIN(total_cost) FROM routes) OR total_cost = (SELECT MAX(total_cost) FROM routes);
