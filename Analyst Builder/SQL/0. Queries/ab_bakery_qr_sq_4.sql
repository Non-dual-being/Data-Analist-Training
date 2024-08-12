SELECT product_id,
quantity,
(SELECT AVG(quantity) FROM ordered_items) 'AVG Quantity'
FROM ordered_items
;

SELECT product_id,
quantity,
round(quantity / (SELECT SUM(quantity) FROM ordered_items)*100, 2) 'Perc Quantity'
FROM ordered_items
;

SELECT product_id, `AVG Quantity`
FROM (SELECT product_id,
quantity,
(SELECT AVG(quantity) FROM ordered_items) 'AVG Quantity'
FROM ordered_items) sq
;