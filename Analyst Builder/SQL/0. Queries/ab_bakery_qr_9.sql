SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 5, 3; -- start @pos5 en return 3 rows

SELECT c.last_name as 'last-name', c.customer_id 'id', c.total_money_spent AS money
FROM customers c
ORDER BY total_money_spent DESC;
