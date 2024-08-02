SELECT * 
FROM ordered_items
;

SELECT schipper_id, order_id, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price)  > -- total_order_price wont work cuz execution order
	(SELECT MAX(quantity * unit_price) AS total_order_price
    FROM ordered_items
    WHERE shipper_id = 1)
;