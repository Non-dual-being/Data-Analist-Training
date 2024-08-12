#standardizing Data
use bakery;
SELECT * FROM customer_sweepstakes;

SELECT phone, REGEXP_REPLACE(phone, '[()-/+]', '')
FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET phone = REGEXP_REPLACE(phone, '[()-/+]', '');

SELECT * FROM customer_sweepstakes;

SELECT phone, 
CONCAT(SUBSTRING(phone,1,3), '-',SUBSTRING(phone,4,3), '-', SUBSTRING(phone,7,4)) 'phone_nr'
FROM customer_sweepstakes
WHERE Phone <> '';

UPDATE customer_sweepstakes
SET phone = CONCAT(SUBSTRING(phone,1,3), '-',SUBSTRING(phone,4,3), '-', SUBSTRING(phone,7,4));

UPDATE customer_sweepstakes
SET phone = ''
WHERE Phone = '--';

SELECT phone FROM customer_sweepstakes;

SELECT birth_date FROM customer_sweepstakes;

SELECT birth_date, 
IF (STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL, STR_TO_DATE(birth_date, '%m/%d/%Y'), STR_TO_DATE(birth_date, '%Y/%d/%m'))
FROM customer_sweepstakes;

SELECT birth_date FROM customer_sweepstakes;


UPDATE customer_sweepstakes
SET birth_date = IF (STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL, STR_TO_DATE(birth_date, '%m/%d/%Y'), STR_TO_DATE(birth_date, '%Y/%d/%m'));

SELECT `Are you over 18?`,
       CASE 
           WHEN `Are you over 18?` REGEXP 'Y|Y+' THEN 'Y'
           WHEN `Are you over 18?` REGEXP 'N|N+' THEN 'N'
           ELSE `Are you over 18?`
       END AS `Processed_Age`
FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET `Are you over 18?` =  CASE 
           WHEN `Are you over 18?` REGEXP 'Y|Y+' THEN 'Y'
           WHEN `Are you over 18?` REGEXP 'N|N+' THEN 'N'
           ELSE `Are you over 18?`
       END;
       
SELECT * FROM customer_sweepstakes;
