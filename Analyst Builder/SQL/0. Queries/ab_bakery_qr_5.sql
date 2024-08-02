SELECT *
FROM customers
WHERE state = 'PA' OR (birth_date > '1998-01-01' AND total_money_spent > 1000);

-- if there not from pa and there born after the 1998 then their money spent has to be 1000

SELECT *
FROM customers
WHERE (state = 'PA' OR birth_date > '1998-01-01') AND total_money_spent > 1000;
-- the and is now also active on state

SELECT * 
FROM customers
WHERE NOT state = 'PA';

SELECT * 
FROM customers
WHERE state != 'PA';

SELECT * 
FROM customers
WHERE NOT total_money_spent > 1000 and state = 'PA';

SELECT * 
FROM customers
WHERE NOT (total_money_spent > 1000 and state = 'PA');

