SELECT * FROM bakery.customer_sweepstakes;

# ALTER TABLE customer_sweepstakes RENAME COLUMN `ï»¿sweepstake_id` TO  `sweepstake_id`;

SELECT customer_id, COUNT(customer_id) '#ikneemerzonog1'
FROM customer_sweepstakes
GROUP BY customer_id
HAVING `#ikneemerzonog1` > 1;

SELECT *
FROM
(SELECT customer_id, 
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id) AS Row_num
FROM customer_sweepstakes) SQ
WHERE Row_num > 1;

DELETE FROM customer_sweepstakes 
WHERE sweepstake_id IN (
	SELECT sweepstake_id
	FROM (
		SELECT sweepstake_id, 
		ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id) AS Row_num
		FROM customer_sweepstakes) SQ
		WHERE Row_num > 1);
# it deletes only the dups cuz of row numeber 2 , 1 stays in tact

