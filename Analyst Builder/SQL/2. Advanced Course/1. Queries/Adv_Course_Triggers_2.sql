-- TRIGGERS 2

SHOW TRIGGERS
WHERE EVENT = 'INSERT';

DROP TRIGGER IF EXISTS update_invoices_with_payements;

DROP TRIGGER update_invoices_with_when_deleted
CREATE TRIGGER 