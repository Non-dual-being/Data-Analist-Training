DROP PROCEDURE IF EXISTS percentage_of_orders;
DELIMITER $$
CREATE PROCEDURE percentage_of_orders(p_product_id INT, OUT sum_totals DECIMAL(9,2))
BEGIN 
	DECLARE all_totals DECIMAL(9,2);
    DECLARE percentage_total DECIMAL(9,2) DEFAULT NULL;
    
    #settings the out_variable tot the total of orderso the provided id
	IF p_product_id IS NULL THEN SET p_product_id = 1001; 
    END IF;
	SELECT SUM(order_total)
    INTO sum_totals
    FROM customer_orders
    WHERE product_id = p_product_id;
    
    # Setting all totals 
    SELECT SUM(order_total)
    INTO all_totals
    FROM customer_orders;
    
    SET percentage_total = ROUND((sum_totals/all_totals*100),2);
    
    SELECT sum_totals;
    SELECT all_totals;
    SELECT percentage_total;
END $$
DELIMITER ;


CALL percentage_of_orders(NULL, @sum_totals);

-- Sesion
SELECT @sum_totals;

-- local
SELECT @all_totals;
SELECT @percentage_total;


