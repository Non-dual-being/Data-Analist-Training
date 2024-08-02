SELECT * 
FROM customers
WHERE total_money_spent BETWEEN 500 AND 1000; -- 500 and 100 are incl

SELECT * 
FROM customers
WHERE total_money_spent >=450 and total_money_spent <=1000;

SELECT *
FROM customers 
WHERE city BETWEEN 'D' and 'S'; -- sc wil not be included cuz s is the end