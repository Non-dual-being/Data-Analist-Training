
SELECT * 
FROM products;

SELECT first_name, last_name
FROM customers
UNION
SELECT product_id, product_name
FROM products;

SELECT first_name, last_name, 'Old' as label
FROM customers
WHERE YEAR(birth_date) < 1950
UNION DISTINCT
SELECT first_name, last_name, 'Good Tipper'
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
WHERE tip > 3
UNION DISTINCT -- union all is posible
SELECT first_name, last_name, 'big spender' 
FROM customers
WHERE total_money_spent > 1100
ORDER BY first_name, last_name;

