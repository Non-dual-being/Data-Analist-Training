#standardizing Data
use bakery;
SELECT * FROM customer_sweepstakes;

SELECT phone, REGEXP_REPLACE(phone, '[()-/+]', '')
FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET phone = REGEXP_REPLACE(phone, '[()-/+]', '');

SELECT * FROM customer_sweepstakes;

UPDATE customer_sweepstakes cs
JOIN customer_sweepstakes_staging css
ON cs.sweepstake_id = css.`ï»¿sweepstake_id`
SET cs.birth_date = css.birth_date;

SELECT birth_date FROM customer_sweepstakes
