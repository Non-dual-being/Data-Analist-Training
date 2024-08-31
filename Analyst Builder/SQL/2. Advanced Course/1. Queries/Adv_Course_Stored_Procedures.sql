CREATE PROCEDURE large_order_totals ()
SELECT * 
FROM customer_orders
WHERE order_total > 20;

DELIMITER $$
CREATE PROCEDURE large_order_totals_2 ()
BEGIN
	SELECT * 
	FROM customer_orders
	WHERE order_total > 20;
    SELECT * 
	FROM customer_orders
	WHERE order_total > 5;
END $$

DELIMITER ;


CALL large_order_totals();
CALL large_order_totals_2();