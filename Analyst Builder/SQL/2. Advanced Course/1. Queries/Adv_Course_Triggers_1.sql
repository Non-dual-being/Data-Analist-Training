-- Triggers

use bakery;

SELECT *
FROM client_invoices;

SELECT * 
FROM client_payments;


DELIMITER $$
CREATE TRIGGER update_invoices_with_when_deleted
	AFTER DELETE ON client_payments
    FOR EACH ROW
BEGIN
	UPDATE client_invoices
    SET total_paid = total_paid - OLD.amount_paid -- to make sure only new amounts after insert are added and not existings amounts
    WHERE invoice_id = OLD.invoice_id;
END $$
DELIMITER ;

DELETE FROM client_payments WHERE payment_id = 11;

DELIMITER $$
CREATE TRIGGER update_invoices_with_payements
	AFTER INSERT ON client_payments
    FOR EACH ROW
BEGIN
	UPDATE client_invoices
    SET total_paid = total_paid + NEW.amount_paid -- to make sure only new amounts after insert are added and not existings amounts
    WHERE invoice_id = NEW.invoice_id;
END $$
DELIMITER ;

INSERT INTO client_payments
VALUES (11, 1001, 3, CURRENT_DATE, 1003.87);
