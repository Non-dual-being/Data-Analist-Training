use bakery;
SELECT * 
FROM products p 
JOIN customer_orders co
	ON co.product_id = p.product_id
ORDER BY p.product_id;

SELECT * 
FROM products p 
NATURAL JOIN customer_orders co
ORDER BY p.product_id;