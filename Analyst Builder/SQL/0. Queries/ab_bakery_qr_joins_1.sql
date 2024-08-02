SELECT * 
FROM customers c 
INNER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id;
 
SELECT *
FROM products;

SELECT * 
FROM customer_orders;

SELECT p.product_name, SUM(co.order_total) 'total money spent', COUNT(distinct(co.customer_id)) 'count customers ordered'
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
GROUP BY product_name
ORDER BY SUM(order_total) DESC;

SELECT *
FROM suppliers;

SELECT *
FROM ordered_items;
USE bakery;

SELECT s.name 'supplier', oi.shipper_id, oi.product_id, sum(oi.quantity) 'total amount ordered'
FROM ordered_items oi
JOIN suppliers s
	ON oi.shipper_id = s.supplier_id
GROUP BY oi.shipper_id, oi.product_id
ORDER BY sum(oi.quantity) DESC;