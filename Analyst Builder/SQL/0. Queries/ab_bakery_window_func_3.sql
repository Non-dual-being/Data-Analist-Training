use bakery;
SELECT *, RANK() OVER()
FROM Employees;

SELECT * 
FROM(
SELECT *, RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS Ranked_Sal # rank is dependent of order by
FROM Employees) SQ
WHERE Ranked_Sal < 3
;

SELECT * 
FROM(
SELECT *, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS Ranked_Sal # rank is dependent of order by
FROM Employees) SQ
WHERE Ranked_Sal < 3
;

