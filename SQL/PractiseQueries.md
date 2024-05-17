#data-analist #coding #sql
```sql
SELECT first_name, 
	last_name, 
    birth_date,
    age,
    age + 10
FROM employee_demographics;
```

this will add new column and add 10

pendas order will be used to for operation (mathematics)


```sql
SELECT distinct first_name, gender
FROM employee_demographics;
```
This look at distinct combination of first_name en gender

```sql
SELECT gender, COUNT(*) as aantal
FROM employee_demographics
GROUP BY gender;

```
Eerst wordt select gedaan, dan group by en dan de telling

```sql
SELECT gender, COUNT(*) as aantal
FROM employee_demographics
WHERE gender = "male"
GROUP BY gender;

```

```sql
SELECT *
FROM employee_demographics
WHERE (birth_date > '1985-01-01' OR NOT gender = "male") 
	and not first_name = "Leslie"
```

```sql
SELECT *
FROM employee_demographics
WHERE (birth_date > '1985-01-01' OR NOT gender = 'male') 
	and not first_name like 'Ke%'
```

like means anything thats doenst start with 'Ke'
```sql
SELECT *
FROM employee_demographics
WHERE (birth_date > '1985-01-01' OR NOT gender = 'male') 
	and not first_name like '_e__';
```

This that the first name must not be like kelt or pelt 

```sql
SELECT *
FROM employee_demographics
WHERE (birth_date like '1989%');
```

```sql
SELECT gender
FROM employee_demographics
GROUP BY gender;

```

`als je geen aggregratie functie toepast, zoals first_name, zal er ook niet gegroepeerd worden. Nu werkt het wel omdat in de select ook gender staat'

```sql
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;
```
```sql
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
```
Groepeer eerst over occupation en salary, je zie alle unieke occupations en daarbijhorende salarissen gegroepeerd

```sql
SELECT gender, AVG(age), MAX(age), MIN(age)
FROM employee_demographics
GROUP BY gender
```
```sql
SELECT gender, AVG(age), MAX(age), MIN(age), count(age)
FROM employee_demographics
GROUP BY gender
```


```sql
SELECT *
FROM employee_demographics
order by gender, age
```

```sql
SELECT *
FROM employee_demographics
order by gender, age DESC
```

```sql
SELECT *
FROM employee_demographics
order by age, gender
```
Dit kan misleidend zijn, omdat als age alleen unieke waarden heeft en geen dubbele, dan zal gender niet gebruik worden

```sql
SELECT *
FROM employee_demographics
WHERE AVG(AGE) > 40
GROUP BY GENDER

```
Dit werkt niet omdat average age nog niet bestaat, als het wordt aangeroepen. Eerst moet er gegroepeerd worden, maar als de where clausule wordt opgeroeen, is er nog niet gegroepeerd. 

```sql
SELECT *
FROM employee_demographics
GROUP BY GENDER
HAVING AVG(age) > 40;
```
dit werkt wel

```sql
SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation;
```

```sql
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 3000;
```
Hier ga je voor de groep by alleen de mangeres pakken, daarna ga je daarop groeperen en kijk je van de groepering waar de salaris hoger is dan een specifieke waarde

```sql
SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;
```

The three oldest people

```sql
SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3, 1;
```
Hiermee selecteer je de vierde oudste persoon.

```sql
SELECT gender, avg(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
```

```sql
SELECT * 
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;
-- inner join wil join all the rows that have the same that in the employee_id

```
```sql
SELECT * 
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;
--allias
```

```sql
SELECT dem.employee_id, age, occupation, salary
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;
```

```sql
SELECT dem.employee_id, age, occupation, salary
FROM employee_demographics as dem --LEFT TABLE
LEFT OUTER JOIN employee_salary as sal --RIGHT Tabel
	ON dem.employee_id = sal.employee_id
;

--A LEFT OUTER JOIN takes everynting form the FROM table en returns everything that has a match with the right table

```

```sql
SELECT dem.employee_id, age, occupation, salary
FROM employee_demographics as dem --LEFT TABLE
RIGHT OUTER JOIN employee_salary as sal --RIGHT Tabel
	ON dem.employee_id = sal.employee_id
;

--A RIGHT OUTE will tak everyhting from the right tabel en returns the rows if their is a match with the left tabel
```

```sql
SELECT *
FROM employee_salary as Emp_Sal_1
JOIN employee_salary as Emp_Sal_2
	ON Emp_Sal_1.employee_id = Emp_Sal_2.employee_id;
 --inner join
```

```sql
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	on dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	on sal.dept_id = pd.department_id;
	-- multiple join
```


```sql
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;
--union returns distinct values

```

```sql
SELECT first_name, last_name, 'Old man' as label
FROM employee_demographics
WHERE age > 40 and gender = 'Male'
UNION
SELECT first_name, last_name, 'Old woman' as label
FROM employee_demographics
WHERE age > 40 and gender = 'Female'
UNION
SELECT first_name, last_name, 'Hightly Paid employee' as label
FROM employee_salary
WHERE salary > 70000
;
```
![[Pasted image 20240510122500.png]]

```sql
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY length(first_name);
```

```sql
SELECT first_name, LOWER(first_name)
FROM employee_demographics
ORDER BY first_name ASC
```

```sql
SELECT TRIM(' SKY ') as 'Without space'
```

```sql
SELECT
	length(' SKY ') as untrimmed,
    length(trim(' SKY ')) as trimmend,
    (LENGTH(' SKY ') - LENGTH(TRIM(' SKY '))) AS 'Spaces removed'

```

```sql
SELECT first_name,
LEFT(first_name, 4) AS 'left 4 characters',
RIGHT(first_name, 4) AS 'right 4 characters'
FROM employee_demographics
```

```sql
SELECT first_name,
LEFT(first_name, 4) AS 'left 4 characters',
RIGHT(first_name, 4) AS 'right 4 characters',
SUBSTRING(first_name, 3, 2)
FROM employee_demographics
--substring wil start from the third character en display 2 characters from there going right, starting with the third
```

```sql
SELECT first_name, birth_date,
LEFT(first_name, 4) AS 'left 4 characters',
RIGHT(first_name, 4) AS 'right 4 characters',
SUBSTRING(birth_date, 6, 2) as birthmonth
FROM employee_demographics
```
```sql
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics
```
```sql
SELECT first_name, locate('An', first_name)
FROM employee_demographics
```

```sql
SELECT first_name, last_name,
concat(first_name, " ",last_name)
FROM employee_demographics
```

```sql
SELECT first_name, last_name, age,
CASE
	WHEN age <=30 then 'young'
    when age between 31 and 50 then 'middle aged'
    when age >= 50 then 'andries'
END AS ages
FROM employee_demographics
```

```sql
SELECT first_name, last_name, salary, dept_id,

CASE
	WHEN (dept_id <> 6 and salary <= 50000) THEN salary + (salary * 0.05)
    WHEN (dept_id <> 6 and Salary > 50000) then salary + (salary * 0.07)
    WHEN (dept_id = 6 and salary <= 50000) then ((salary * 1.05)* 1.1)
    WHEN (dept_id = 6 and salary > 50000) then ((salary * 1.07)* 1.1)
END AS 'new_salary'

FROM employee_salary
```

```sql
SELECT * 
FROM employee_demographics
WHERE employee_id in 
	(SELECT employee_id 
		FROM employee_salary
        WHERE dept_id = 1);
--subquerie
```

```sql
SELECT first_name, salary,
	(SELECT AVG(salary)
		FROM employee_salary)
FROM employee_salary;
--subquerie
```

```sql
SELECT AVG(max_age)
FROM
(SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS Aggr_Table
--select the avg age of the max_age which is the result of de grouped by gender of table employee_demograhics

```
```sql
SELECT gender, AVG(salary) as avg_salary, AVG(age) as avg_age
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id
GROUP BY gender;
    
```

![[Pasted image 20240510195720.png]]


```sql
SELECT gender, AVG(salary) OVER()
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id
	--windows func
```

![[Pasted image 20240510195813.png]]

```sql
SELECT gender, AVG(salary) OVER(partition by gender)
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id
```

![[Pasted image 20240510195946.png]]
```sql
SELECT dem_emp.first_name AS 'firstname', dem_emp.last_name as 'lastname', gender, AVG(salary) OVER(partition by gender)
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id
```

![[Pasted image 20240510200251.png]]

```sql
SELECT dem_emp.first_name AS 'firstname', dem_emp.last_name as 'lastname', gender, salary, SUM(salary) OVER(partition by gender order by dem_emp.employee_id) AS Rolling_Total
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id;
--ROLING TOTal adds op salary grouped by gender
```


```sql
SELECT dem_emp.first_name AS 'firstname', dem_emp.last_name as 'lastname', gender, salary, row_number() OVER()
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id;
```
![[Pasted image 20240510201430.png]]

```sql
SELECT dem_emp.first_name AS 'firstname', dem_emp.last_name as 'lastname', gender, salary, row_number() OVER(partition by gender order by salary desc)
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id;

```

![[Pasted image 20240510201636.png]]

```sql
SELECT dem_emp.first_name AS 'firstname', dem_emp.last_name as 'lastname', gender, salary, row_number() OVER(partition by gender order by salary desc) AS 'row_num',
RANK() OVER(partition by gender order by salary desc) AS 'Rank_num'
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id;
```
![[Pasted image 20240510202352.png]]


```sql
SELECT dem_emp.first_name AS 'firstname', dem_emp.last_name as 'lastname', gender, salary, row_number() OVER(partition by gender order by salary desc) AS 'row_num',
RANK() OVER(partition by gender order by salary desc) AS 'Rank_num',
dense_rank() OVER(partition by gender order by salary desc) AS 'Dense_Rank_num'
FROM employee_demographics as dem_emp
INNER JOIN employee_salary as sal_emp
	ON dem_emp.employee_id = sal_emp.employee_id;
	--dens rank returns numerical numbers based on the partition and order by whereas rank gives postitional numbers
```

![[Pasted image 20240510202855.png]]

```sql
WITH CTE_Example AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics AS dem
	JOIN employee_salary AS sal
		ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * FROM CTE_Example
-- CTE
```

```sql
-- CTE COMMON TABLE EXAMPLE

WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics AS dem
WHERE birth_date > '1985-01-01'
),

CTE_Example_2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)

select * FROM CTE_Example
JOIN CTE_Example_2
	ON CTE_Example.employee_id = CTE_Example_2.employee_id

```

```sql
WITH CTE_Example_3 (ID, Gender, Birth_date) AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
)
SELECT * FROM CTE_Example_3
```

```sql
-- Temporary Tables
CREATE TEMPORARY TABLE temp_table
(
	first_name varchar(50),
	last_name varchar(50),
    favorite_movie varchar(100)
    
);
INSERT INTO temp_table
VALUES('Adries', 'Henk-Jan', 'Minecraft');

SELECT * FROM temp_table;
```
```sql
CREATE PROCEDURE large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();
-- by way of example good practise is to store complex queries, not this
```

```sql
DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
SELECT * 
FROM employee_salary
WHERE salary >= 50000;
SELECT * 
FROM employee_salary
WHERE salary >= 10000;
END $$
DELIMITER ;
CALL large_salaries2();
```
```sql
CREATE PROCEDURE large_salaries4(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = p_employee_id
    ;

END $$
-- p stands for paramater
```

```sql

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$

DELIMITER $$;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Kevin', 'De Vries', 'Mechanic', 53000, NULL);

SELECT * FROM employee_demographics where first_name = 'Kevin'
-- TRIGGER is activited by events
```

```sql
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE 
    FROM employee_demograhics
    WHERE age >=60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE '%event%' -- event_scheduler may be off

```

```sql
-- Data Cleaning
-- 1 Remove duplicaties
-- 2 Standarize the Data
-- 3 NUll Values or blank values
-- 4 Remove Any Columns
SELECT * FROM layoffs;

CREATE TABLE layoffs_staging
LIKE layoffs; -- empy table wiht columns from layoffs

INSERT layoffs_staging
SELECT * FROM layoffs; -- insert values

-- never clean raw data, make copy

```

```sql
-- remove dups
SELECT *, 
ROW_NUMBER() 
OVER(partition by 
	company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
FROM layoffs_staging;
```

```sql
WITH dup_check_cte AS
(
select *,
ROW_NUMBER() OVER(
	PARTITION  BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
    FROM layoffs_staging
)
SELECT * FROM dup_check_cte
WHERE row_num > 1
```

```sql
WITH dup_check_cte AS
(
select *,
ROW_NUMBER() OVER(
	PARTITION  BY company, location, stage, country, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
    FROM layoffs_staging
)
SELECT * 
FROM layoffs_staging 
where (company, location, industry) in(

SELECT company, location, industry FROM dup_check_cte
WHERE row_num > 1)
ORDER BY company;
-- SELECT DUPS WITH Row_num>1 with subq
```

```sql
CREATE TABLE `layoffs_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

```


```sql
INSERT INTO layoffs_staging_2
select *,
ROW_NUMBER() OVER(
	PARTITION  BY company, location, stage, country, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
    FROM layoffs_staging;

DELETE FROM layoffs_staging_2 where row_num = 2;
```

```sql
-- standarisation
SELECT company, trim(company)
FROM layoffs_staging_2 
```


```sql
UPDATE layoffs_staging_2
 SET company = TRIM(company);
```

```sql
UPDATE layoffs_staging_2 
	SET industry = 'Crypto'
    WHERE industry LIKE 'Crypto%';
```

```sql
SELECT DISTINCT(industry) 
FROM layoffs_staging_2 
WHERE industry like '%Crypto%';
```

```sql
SELECT DISTINCT country, TRIM(TRAILING '.' FROM COUNTRY)
FROM layoffs_staging_2 order by country ;
```

```sql
 SELECT `date`,
 str_to_date(`date`, '%m%d%Y')
 FROM layoffs_staging_2;
```

```sql
ALTER TABLE layoffs_staging_2
MODIFY column `date` DATE;
```

```sql
SELECT * 
	FROM layoffs_staging_2 t1
    JOIN layoffs_staging_2 t2
    ON t1.company	= t2.company
    AND t1.location = t1.location
WHERE t1.industry is NULL OR t1.industry = '' AND t2.industry is NOT NULL;
-

```sql
UPDATE layoffs_staging_2 t1
JOIN layoffs_staging_2 t2
	ON t1.company	= t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry 
WHERE (t1.industry is NULL OR t1.industry = '') AND (t2.industry is NOT NULL and t2.industry <> "");
-- a self join to update the blank or null values of industry where the compagnie and the location are the samen, but the industry value is left out
```


```sql
SELECT * FROM layoffs_staging_2 WHERE percentage_laid_off = 1 AND total_laid_off IS NOT NULL
ORDER BY total_laid_off desc;
-- first quick analyses
```

```sql
SELECT * FROM layoffs_staging_2 WHERE percentage_laid_off = 1 AND total_laid_off IS NOT NULL
ORDER BY funds_raised_millions desc;
```


```sql
SELECT company, SUM(total_laid_off) sum_laid_off, SUM(funds_raised_millions)
FROM layoffs_staging_2
GROUP BY company
HAVING sum_laid_off IS NOT NULL
ORDER by sum_laid_off DESC
```

```sql
SELECT industry, SUM(total_laid_off) AS sum_laid_off, SUM(funds_raised_millions)
FROM layoffs_staging_2
GROUP BY industry
HAVING sum_laid_off IS NOT NULL
ORDER by sum_laid_off DESC;
```

```sql
SELECT YEAR(`Date`), country, SUM(total_laid_off) AS laidoff, SUM(funds_raised_millions) AS Funds
FROM layoffs_staging_2
GROUP BY YEAR(`Date`), country
ORDER BY YEAR(`Date`) DESC, laidoff DESC;
```

```sql
(
SELECT substring(`date`, 1, 7) AS `MONTH`, sum(total_laid_off) AS total_off  
FROM layoffs_staging_2
GROUP BY substring(`date`, 1, 7) 
HAVING `MONTH` IS NOT NULL AND `MONTH` > '2020'
ORDER BY substring(`date`, 1, 7) ASC
)
SELECT `MONTH`, SUM(total_off) OVER(ORDER BY `MONTH`)
FROM Rolling_total;
-- The CTE is a month total which then partitioned over the month is added up. 

```

![[Pasted image 20240517091559.png]]

```sql
WITH Rolling_Total AS (
  SELECT
    substring(`date`, 1, 7) AS `MONTH`,
    industry,
    sum(total_laid_off) AS total_off  
  FROM layoffs_staging_2
  GROUP BY industry, substring(`date`, 1, 7)
  HAVING `MONTH` IS NOT NULL AND `MONTH` > '2020'
  ORDER BY `MONTH` ASC
)

SELECT
  `MONTH`,
  industry,
  SUM(total_off) OVER(PARTITION BY industry ORDER BY `MONTH`) AS cumulative_laid_offs
FROM Rolling_Total;
-- same thing but then also grouped by industry
```
![[Pasted image 20240517092026.png]]

```sql
WITH Company_Year AS (
 SELECT
    company, YEAR(`Date`) AS `year`, SUM(total_laid_off) as 'totals'
  FROM layoffs_staging_2
  GROUP BY company, `year`
  HAVING totals IS NOT NULL and `year` IS NOT NULL
  ORDER BY `year` DESC, totals DESC
)

SELECT company, `year`, totals, RANK() OVER(partition by `year` ORDER BY totals DESC) AS 'Rank_num'
FROM Company_Year;
-- totalen van per jaar per bedrijf gerankt op basis van een ordering op de totalen van hoog naar laag
```

![[Pasted image 20240517094630.png]]