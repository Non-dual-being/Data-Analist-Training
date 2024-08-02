SELECT *
FROM customers
WHERE customers_id IN 
	(select customer_id 
    FROM customer_orders);

SELECT *
FROM customers
WHERE EXISTS
	(select customer_id 
    FROM customer_orders);
    
SELECT *
FROM customers c
WHERE EXISTS
	(select customer_id 
    FROM customer_orders
    WHERE customer_id = c.customer_id);
#EXISTS is used for extremly large databases

