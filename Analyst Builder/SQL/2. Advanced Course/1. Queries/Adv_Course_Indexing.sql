-- INDEXING 

use bakery;

EXPLAIN SELECT * 
FROM us_household_income
WHERE Area_Code = 203;

CREATE INDEX idx_area_code
	ON bakery.us_household_income (Area_Code);
    
SHOW INDEXES IN bakery.us_household_income;

-- CARDINALITY stands for unique values in de indexed column

DROP INDEX idx_area_code ON bakery.us_household_income;


