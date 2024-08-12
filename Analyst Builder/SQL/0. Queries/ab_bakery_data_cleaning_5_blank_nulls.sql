UPDATE customer_sweepstakes
SET PHONE = NULL
WHERE phone = '';

UPDATE customer_sweepstakes
SET income = NULL
WHERE income = '';

SELECT AVG(income)
FROM customer_sweepstakes;

SELECT AVG(COALESCE(income,0))
FROM customer_sweepstakes;

SELECT birth_date, `Are you over 18?`
FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET `Are you over 18?` = 'N'
WHERE (YEAR(NOW()) - 18) <= YEAR(birth_date);

UPDATE customer_sweepstakes
SET `Are you over 18?` = 'Y'
WHERE (YEAR(NOW()) - 18) > YEAR(birth_date);

SELECT * from customer_sweepstakes;

UPDATE customer_sweepstakes cs
JOIN customer_sweepstakes_staging css
	ON cs.sweepstake_id = css.ï»¿sweepstake_id
SET cs.birth_date = css.birth_date;


SELECT birth_date,
       CASE
           WHEN birth_date REGEXP '^[0-9]{4}' THEN
               CONCAT(SUBSTRING(birth_date, 6, 2), '-', SUBSTRING(birth_date, 9, 2), '-', SUBSTRING(birth_date, 1, 4))
           ELSE NULL
       END AS converted_b_date
FROM customer_sweepstakes;

SELECT birth_date,
       CASE
           WHEN birth_date REGEXP '^[0-9]{4}' THEN
               CONCAT(SUBSTRING(birth_date, 10), '/', SUBSTRING(birth_date, 6, 2), '/', SUBSTRING(birth_date, 1, 4))
           ELSE NULL
       END AS converted_b_date
FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET birth_date = REGEXP_REPLACE(birth_date, '/', '-');

# alternative
/*
UPDATE customer_sweepstakes
SET birth_date = REPLACE(birth_date, '/', '-');
*/

select birth_date, STR_TO_DATE(birth_date, '%m/%d/%Y') from customer_sweepstakes;

UPDATE customer_sweepstakes
SET birth_date = CASE
                    WHEN STR_TO_DATE(birth_date, '%m/%d/%Y') IS NULL
                     THEN CONCAT(SUBSTRING(birth_date, 10), '/', SUBSTRING(birth_date, 6, 2), '/', SUBSTRING(birth_date, 1, 4))
                    ELSE birth_date
                 END;

	
UPDATE customer_sweepstakes
SET birth_date = TRIM(birth_date);

SELECT * FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET birth_date = STR_TO_DATE(birth_date, '%m/%d/%Y');

SELECT * FROM customer_sweepstakes