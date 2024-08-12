
SELECT * 
FROM (
SELECT  c.customer_id, first_name, order_total, 
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC) AS row_num
FROM customers c
JOIN customer_orders co
	USING(customer_id)) AS SQ
WHERE row_num < 3


