-- Composite Indexing

EXPLAIN SELECT *
FROM us_household_income
WHERE State_Name = 'Rhode Island'
AND Aland > 500000;

CREATE INDEX idx_state_Aland 
ON bakery.us_household_income(State_Name(8),Aland);

EXPLAIN SELECT *
FROM us_household_income
WHERE State_Name = 'Rhode Island'
AND Aland > 500000;

EXPLAIN SELECT *
FROM us_household_income
WHERE State_Name = 'Rhode Island'
AND Aland > 10000000;

SHOW INDEX IN bakery.us_household_income;

EXPLAIN SELECT * 
FROM bakery.us_household_income
WHERE State_ab = 'NC'
AND City LIKE 'A%';

SELECT COUNT(DISTINCT State_ab), COUNT(DISTINCT City)
FROM bakery.us_household_income;

-- Indexes logic depends on unique values so what is smart, to index first on the column 
-- with small amount of unique values or big one, when doing a index of two columns combined
-- In this case the distinct values of city is 8000 on a data set of 32 000

-- THe conclusion is that is verry querie depended. 
CREATE INDEX idx_city_stateab 
ON bakery.us_household_income(City(10),State_ab(2));

CREATE INDEX idx_stateab_City
ON bakery.us_household_income(State_ab(2),City(10));



