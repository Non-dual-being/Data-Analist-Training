CREATE TEMPORARY TABLE Temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT * 
FROM temp_table;

INSERT INTO Temp_table
VALUES ('Klosjaartje', 'Kuipers', 'oliebol in Gent');

CREATE TEMPORARY TABLE Temp_table2
SELECT *
FROM employees
WHERE salary > 5000;

