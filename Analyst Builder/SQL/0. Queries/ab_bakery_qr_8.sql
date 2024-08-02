-- % any, null or many characters

SELECT * FROM customers
WHERE first_name LIKE 'K%'; -- not case sensitive

SELECT * FROM customers
WHERE first_name LIKE '%n'; -- not case sensitive

SELECT COUNT(*) as 'Ronilla' FROM customers
WHERE first_name LIKE '%n%'; -- not case sensitive

-- % any, null or many characters
-- _ on character

SELECT * 
FROM customers
WHERE first_name LIKE '_o_';

SELECT * 
FROM customers
WHERE last_name LIKE 's%';

SELECT * 
FROM customers
WHERE phone LIKE '975%';
