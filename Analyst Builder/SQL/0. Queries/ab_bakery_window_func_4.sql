SELECT * 
FROM customers
WHERE first_name like '%K%'
;

SELECT * 
FROM customers
WHERE first_name regexp 'K'
;

SELECT first_name, REGEXP_REPLACE(first_name, 'a', 'b')
FROM customers
;

SELECT first_name, REGEXP_LIKE(first_name, 'a')
FROM customers
;
# returns 1 of pattern is found, 0 if not


SELECT first_name, REGEXP_INSTR(first_name, 'a')
FROM customers
;
# retunrs location of char

SELECT first_name, REGEXP_SUBSTR(first_name, 'char')
FROM customers;
# if found then pulles out sub, otherwise null
