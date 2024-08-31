-- EVENTS
-- EVENTS ARE SCHEDULED

SHOW VARIABLES LIKE '%event%';

SET GLOBAL event_scheduler = 'ON';

use bakery;

SELECT * 
FROM customer_orders
ORDER BY order_date;

DELIMITER $$
CREATE EVENT delete_old_customer_orders
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE 
    FROM customer_orders
    WHERE order_date < NOW() - INTERVAL 5 YEAR;
END $$

DELIMITER ;

SHOW EVENTS;

DELIMITER $$
ALTER EVENT delete_old_customer_orders
ON SCHEDULE EVERY 30 DAY
DO 
BEGIN
	DELETE 
    FROM customer_orders
    WHERE order_date < NOW() - INTERVAL 5 YEAR;
END $$

DELIMITER ;

DROP EVENT IF EXISTS delete_old_customer_orders;


