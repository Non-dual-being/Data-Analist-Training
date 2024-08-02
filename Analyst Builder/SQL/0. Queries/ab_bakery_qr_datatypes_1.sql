SELECT sale_price, round(sale_price,1)
FROM products;

SELECT sale_price, ceiling(sale_price) 'ceiled price', FLOOR(sale_price) 'Floored price'
FROM products;

SELECT ABS(-100);