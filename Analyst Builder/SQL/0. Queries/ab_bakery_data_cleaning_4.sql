use bakery;
SELECT address
FROM customer_sweepstakes;

SELECT address, SUBSTRING_INDEX(address,',', 1), SUBSTRING_INDEX(address, ',', -1)
FROM customer_sweepstakes;

SELECT address, 
SUBSTRING_INDEX(address,',', 1) 'street',
SUBSTRING_INDEX(SUBSTRING_INDEX(address,',', 2), ',', -1) 'city',
SUBSTRING_INDEX(address, ',', -1) 'state'
FROM customer_sweepstakes;

ALTER TABLE customer_sweepstakes
ADD COLUMN street VARCHAR (50) AFTER address,
ADD COLUMN city text(30) AFTER street,
ADD COLUMN state text(10) AFTER street;

UPDATE customer_sweepstakes
SET street = SUBSTRING_INDEX(address,',', 1);

UPDATE customer_sweepstakes
SET city = SUBSTRING_INDEX(SUBSTRING_INDEX(address,',', 2), ',', -1);

UPDATE customer_sweepstakes
SET state = SUBSTRING_INDEX(address, ',', -1) ;

SELECT * FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET state = UPPER(state);

SELECT state from customer_sweepstakes;

SELECT city, city REGEXP('^ +|$ +')
FROM customer_sweepstakes;

UPDATE customer_sweepstakes
SET city = TRIM(city);

