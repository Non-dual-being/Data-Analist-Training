SELECT birth_date, DATE_FORMAT(birth_date, '%M %d %Y')
FROM customers;

SELECT birth_date, DATE_FORMAT(birth_date, '%M %D %Y')
FROM customers;

SELECT birth_date, DATE_FORMAT(birth_date, '%d %M %Y')
FROM customers;