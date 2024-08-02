use bakery;
SELECT concat(c.first_name, ' ',c.last_name) 'customer', p.product_name, sum(co.order_total) 'total_money_spent'
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id
GROUP BY customer, p.product_name
ORDER BY total_money_spent DESC;

