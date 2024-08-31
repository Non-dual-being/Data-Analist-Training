use bakery;

SELECT product_id, SUM(order_total), SUM(tip), COUNT(TIP)
FROM customer_orders
WHERE tip != 0
GROUP BY product_id;

WITH CTE_Example AS
(
SELECT product_id, SUM(order_total) 'summed', SUM(tip), COUNT(TIP)
FROM customer_orders
WHERE tip != 0
GROUP BY product_id
)

SELECT summed
FROM CTE_Example
WHERE summed >(SELECT AVG(summed) FROM CTE_Example);
#summed is needed to put in the where,

WITH CTE_Example (id, summed, tip_summed, tip_counted) AS
(
SELECT product_id, SUM(order_total) , SUM(tip), COUNT(TIP)
FROM customer_orders
WHERE tip != 0
GROUP BY product_id
),
CTE_Example_2 (id, summed, tip_avg, tip_counted) AS
(
SELECT product_id, SUM(order_total) , AVG(tip), COUNT(TIP)
FROM customer_orders
GROUP BY product_id
)


SELECT *
FROM CTE_Example CTE
JOIN CTE_Example_2 CTE2
USING (id)
WHERE CTE2.tip_avg > 2;
