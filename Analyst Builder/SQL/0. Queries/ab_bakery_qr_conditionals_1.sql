SELECT tip,
IF (tip > 1, 'Amazing', 'Cheep') 'Tip_Tag'
FROM customer_orders;

SELECT TIP,
order_total,
IF(tip > 2, order_total * 0.90, order_total * 1.01) 'order_total_tip'
FROM customer_orders
ORDER BY tip ASC, order_total DESC;