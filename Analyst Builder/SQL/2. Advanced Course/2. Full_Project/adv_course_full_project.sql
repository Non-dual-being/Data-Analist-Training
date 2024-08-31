DELIMITER $$
DROP PROCEDURE IF EXISTS Copy_and_Clean_Data;
CREATE PROCEDURE Copy_and_Clean_Data()
BEGIN
	-- creating new copy tabel 
	CREATE TABLE IF NOT EXISTS bakery.us_household_income_cleaned (
	  `row_id` int DEFAULT NULL,
	  `id` int DEFAULT NULL,
	  `State_Code` int DEFAULT NULL,
	  `State_Name` text,
	  `State_ab` text,
	  `County` text,
	  `City` text,
	  `Place` text,
	  `Type` text,
	  `Primary` text,
	  `Zip_Code` int DEFAULT NULL,
	  `Area_Code` int DEFAULT NULL,
	  `ALand` int DEFAULT NULL,
	  `AWater` int DEFAULT NULL,
	  `Lat` double DEFAULT NULL,
	  `Lon` double DEFAULT NULL,
	  `TimeStamp` timestamp 
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    -- inserting data
    INSERT INTO bakery.us_household_income_cleaned
	SELECT *, CURRENT_TIMESTAMP
    FROM bakery.us_household_income;
    
    -- Remove Duplicates
	DELETE FROM us_household_income_cleaned 
	WHERE 
		row_id IN (
		
	);

	-- Fixing some data quality issues by fixing typos and general standardization
	UPDATE us_household_income_cleaned
	SET State_Name = 'Georgia'
	WHERE State_Name = 'georia';

	UPDATE us_household_income_cleaned
	SET County = UPPER(County);

	UPDATE us_household_income_cleaned
	SET City = UPPER(City);

	UPDATE us_household_income_cleaned
	SET Place = UPPER(Place);

	UPDATE us_household_income_cleaned
	SET State_Name = UPPER(State_Name);

	UPDATE us_household_income_cleaned
	SET `Type` = 'CDP'
	WHERE `Type` = 'CPD';

	UPDATE us_household_income_cleaned
	SET `Type` = 'Borough'
	WHERE `Type` = 'Boroughs';
    
END $$
DELIMITER ;

SELECT * FROM bakery.us_household_income_cleaned;

CALL Copy_and_Clean_Data();

SELECT *
FROM us_household_income_cleaned
LIMIT 10;

-- checking unique data
SELECT id
FROM us_household_income_cleaned
group by id
Having count(DISTINCT ID)= 1;

-- same thing
SELECT row_id
	FROM (
		SELECT row_id, id,
			ROW_NUMBER() OVER (
				PARTITION BY id
				ORDER BY id) AS row_num
		FROM 
			us_household_income_cleaned
	) duplicates
	WHERE 
		row_num > 1;
        
CREATE EVENT run_data_cleaning
	ON SCHEDULE EVERY 2 MINUTE
    DO CALL Copy_and_Clean_Data();