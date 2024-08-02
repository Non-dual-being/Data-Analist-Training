SELECT * 
FROM customers;

SELECT first_name, last_name
FROM customers;

SELECT last_name,
first_name,
phone,
city,
state,
total_money_spent,
total_money_spent * 1.1 AS "Money Spent Perc"
FROM customers;

#PENDAS (order of mathemathics)

SELECT DISTINCT city, state
FROM customers;