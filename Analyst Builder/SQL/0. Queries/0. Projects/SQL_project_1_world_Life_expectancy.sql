-- use `word_life_expectancy`;
-- RENAME TABLE `data` TO tabel;
use `word_life_expectancy`;

-- stap 1: create table
CREATE TEMPORARY TABLE temp_dup_cols AS
SELECT CONCAT(Country, Year) AS dup_col
FROM tabel
GROUP BY dup_col
HAVING COUNT(*) > 1;

-- Stap 2: Gebruik de tijdelijke tabel om de duplicaten te verwijderen
DELETE FROM tabel
WHERE CONCAT(Country, Year) IN (SELECT dup_col FROM temp_dup_cols);

-- Stap 3: Verwijder de tijdelijke tabel
DROP TEMPORARY TABLE temp_dup_cols;

#alternative methode
SELECT Row_id
FROM
	(SELECT Row_ID,
	CONCAT(Country, Year) AS Dup_cols,
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) as Row_num
	FROM tabel) SQ
WHERE Row_num = 2;

DELETE FROM tabel WHERE Row_id IN 
	(SELECT Row_id
FROM
	(SELECT Row_ID,
	CONCAT(Country, Year) AS Dup_cols,
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) as Row_num
	FROM tabel) SQ
WHERE Row_num = 2);

SELECT DISTINCT(status), country
FROM tabel
WHERE COUNTRY IN (SELECT country FROM tabel WHERE status = '');

CREATE TEMPORARY TABLE status_update AS
SELECT DISTINCT(Country) 
				FROM tabel 
                WHERE status = 'Developing';

CREATE TEMPORARY TABLE status_update_2 AS
SELECT DISTINCT(Country) 
				FROM tabel 
                WHERE status = 'Developed';
UPDATE tabel
SET Status = 'Developed'
WHERE Country IN (SELECT DISTINCT (COUNTRY) FROM status_update_2);

/*
-- The complete update statement that sql dindt allow
UPDATE tabel
SET STATUS = 'Developing'
WHERE COUNTRY IN 
	(SELECT DISTINCT(Country) 
	FROM tabel
    WHERE Status ='Developing'
    */
                
SELECT DISTINCT(status)
FROM tabel;

DROP TEMPORARY TABLE status_update_2;

#alterantive to set status
use `word_life_expectancy`;

UPDATE tabel t1
JOIN tabel t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing' 
WHERE t1.Status = '' AND t2.Status <> '' AND t2.Status = 'Developing';

SELECT Country, Year, `Life expectancy` 
FROM tabel
WHERE `Life expectancy` = '';

use `word_life_expectancy`;

SELECT Country, YEAR, `Life expectancy` 
FROM tabel
WHERE Country IN
	(SELECT Country FROM tabel WHERE `Life expectancy` = '');
    
    
SELECT t1.Country, t1.Year, t1.`Life expectancy`, 
CASE WHEN 
    t1.`Life expectancy` = '' THEN ROUND((t2.`Life expectancy`+ t3.`Life expectancy`)/2,2) ELSE 'Patrick'END AS 'update',
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`
FROM tabel t1
JOIN tabel t2
	ON t1.Country = t2.Country
    AND
    t1.Year = t2.Year - 1
JOIN tabel t3
	ON t1.Country = t3.Country
    AND
    t1.Year = t3.Year + 1
WHERE t1.`Life expectancy` = '';
	
UPDATE tabel t1
JOIN tabel t2
	ON t1.Country = t2.Country
    AND
    t1.Year = t2.Year - 1
JOIN tabel t3
	ON t1.Country = t3.Country
    AND
    t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy`+ t3.`Life expectancy`)/2,2)
WHERE t1.`Life expectancy` = '';

