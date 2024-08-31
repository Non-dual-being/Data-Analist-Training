use bakery;
DROP PROCEDURE IF EXISTS orders_buy_product2;
DELIMITER $$
CREATE PROCEDURE orders_buy_product2(p_product_id INT, p_order_date DATE)
BEGIN 
	SELECT * 
    FROM customer_orders
    WHERE product_id = p_product_id AND order_date = p_order_date;
END $$

CALL orders_buy_product2(1001, '2020-01-30');

use bakery;

DROP PROCEDURE IF EXISTS orders_buy_product3;
DELIMITER $$
CREATE PROCEDURE orders_buy_product3(p_product_id INT, OUT sum_totals DECIMAL(9,2))
BEGIN 
	IF p_product_id IS NULL THEN SET p_product_id = 1001; 
    END IF;
	SELECT SUM(order_total)
    INTO sum_totals
    FROM customer_orders
    WHERE product_id = p_product_id;
END $$

DELIMITER ;

CALL orders_buy_product3(NULL);

set @sum_totals = 0;
call bakery.orders_buy_product3(1001, @sum_totals);
select @sum_totals;

SELECT ROUND(@sum_totals/SUM(order_total)*100,2) AS perc
FROM customer_orders
;