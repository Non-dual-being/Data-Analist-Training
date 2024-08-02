-- substring(start,n_characters)
SELECT phone, 
SUBSTRING(phone,1,3) 'phone_1', 
SUBSTRING(phone,5,3) 'phone_2',
SUBSTRING(phone,9,3) 'phone_3'
FROM customers;

SELECT phone, REPLACE(phone,'-','--') 'phone-altered'
FROM customers;

SELECT phone, LOCATE('-', phone)
FROM customers;

SELECT phone, 
SUBSTRING(phone,1,3) 'phone_1', 
SUBSTRING(phone,5,3) 'phone_2',
SUBSTRING(phone,9,3) 'phone_3',
CONCAT(SUBSTRING(phone,1,3),SUBSTRING(phone,5,3),SUBSTRING(phone,9,3)) 'phone_def'
FROM customers;
