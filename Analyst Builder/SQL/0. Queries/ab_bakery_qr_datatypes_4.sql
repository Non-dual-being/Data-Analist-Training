#case statements
SELECT *
FROM products;

SELECT product_name, units_in_stock,
CASE 
	WHEN units_in_stock < 20 THEN 'ORDER_NOW'
    WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Check in 3 days'
    WHEN units_in_stock > 51 THEN 'In Stock'
END AS 'Order_Status'
FROM products;

SELECT order_id,
order_date,
CASE
	WHEN YEAR(order_date) = YEAR(now()) -1 THEN 'Active'
    WHEN YEAR(order_date) = YEAR(now()) -2 THEN 'Last Year'
    ELSE 'Archived'
    END AS 'Years'
FROM customer_orders;