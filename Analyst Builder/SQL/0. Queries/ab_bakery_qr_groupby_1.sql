SELECT customer_id, SUM(TIP) 'Summed_tip'
FROM customer_orders
GROUP BY customer_id
HAVING Summed_tip> 6;


SELECT product_id, AVG(order_total)
FROM customer_orders
GROUP BY product_id
ORDER BY order_total desc;

SELECT p.product_name, subquery.avg_order_total
FROM (
    SELECT product_id, AVG(order_total) AS avg_order_total
    FROM customer_orders
    GROUP BY product_id
    ORDER BY avg_order_total DESC
) AS subquery
JOIN products p ON subquery.product_id = p.product_id
ORDER BY subquery.avg_order_total DESC;