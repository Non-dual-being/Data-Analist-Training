use bakery;
SELECT * 
FROM customers c
JOIN customer_orders co
	USING(customer_id)
;

SELECT  c.customer_id, first_name, order_total, MAX(order_total) OVER() AS max_order_total
FROM customers c
JOIN customer_orders co
	USING(customer_id)
;
# OVER takes the max of the column

SELECT  c.customer_id, first_name, order_total, 
MAX(order_total) OVER(PARTITION BY customer_id ) AS max_order_total
FROM customers c
JOIN customer_orders co
	USING(customer_id)
;

#NOW (MAX over total is the total over the id)



