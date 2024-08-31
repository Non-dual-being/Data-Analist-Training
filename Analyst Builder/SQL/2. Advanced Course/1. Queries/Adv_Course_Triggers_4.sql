use bakery;

SHOW INDEXES IN bakery.us_household_income;

SELECT * 
FROM us_household_income;

-- use two indexes cuz or implies two table scans
EXPLAIN SELECT *
FROM us_household_income
WHERE Area_Code = '203'
OR City LIKE 'A%';

-- (AND) 1 row, 100 filtered, 1 index used
EXPLAIN SELECT *
FROM us_household_income
WHERE State_ab = 'Rhode_Island'
AND Aland > 500000;


-- (OR) no index used at all
EXPLAIN SELECT *
FROM us_household_income
WHERE State_ab = 'Rhode_Island'
OR Aland > 500000;

-- 10726 rows scanned
EXPLAIN SELECT Aland
FROM us_household_income
WHERE Aland > 100000;

-- full table scanned cuz of + 10
EXPLAIN SELECT Aland
FROM us_household_income
WHERE Aland + 10 > 100000;

-- Composite indexes are good
-- Order matters
-- Avoiding using Select *
-- Looking at your where clause
-- Full table scans vs indexes, indexes almost always good choice with big data
--  v

