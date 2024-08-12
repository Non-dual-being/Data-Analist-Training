use household;

SELECT * FROM `statistics`;
SELECT * FROM ushouseholdincome;

ALTER TABLE `statistics` RENAME COLUMN `ï»¿id` TO `ID`;

SELECT COUNT(ID) FROM `statistics`;
SELECT COUNT(ID) FROM ushouseholdincome;

SELECT id, COUNT(ID)
FROM ushouseholdincome
GROUP BY ID
HAVING COUNT(ID) > 1;

SELECT * FROM
(SELECT row_id,
id,
(ROW_NUMBER() OVER(PARTITION BY id ORDER BY ID)) 'row_num'
FROM ushouseholdincome) SQ
WHERE row_num > 1;

DELETE FROM ushouseholdincome WHERE row_id IN 
(SELECT row_id FROM
(SELECT row_id,
id,
(ROW_NUMBER() OVER(PARTITION BY id ORDER BY ID)) 'row_num'
FROM ushouseholdincome) SQ
WHERE row_num > 1);

SELECT ID, COUNT(ID)
FROM `statistics`
GROUP BY ID
HAVING COUNT(ID) > 1;

SELECT State_Name, COUNT(State_Name)
FROM `statistics`
GROUP BY State_Name;

SELECT DISTINCT State_name
FROM `ushouseholdincome`
WHERE State_Name REGEXP '^G|^g'
ORDER BY 1;

UPDATE `ushouseholdincome` SET State_Name = 'Georgia' WHERE State_Name = 'georia';
UPDATE `ushouseholdincome` SET State_Name = 'Alabama' WHERE State_Name = 'alabama';

SELECT DISTINCT State_ab
FROM `ushouseholdincome`
WHERE State_ab REGEXP '^ | $'
ORDER BY 1;

SELECT * 
FROM `ushouseholdincome`
WHERE County = 'Autauga County';

UPDATE `ushouseholdincome` SET Place = 'Autaugaville' WHERE row_id = 32;

UPDATE `ushouseholdincome` SET Type = 'Borough' WHERE Type = 'Boroughs';

SELECT Type, COUNT(Type)
FROM `ushouseholdincome`
GROUP BY Type
ORDER BY Type;

SELECT * FROM ushouseholdincome;

SELECT *
FROM ushouseholdincome
WHERE Aland = 0 or Aland IS NULL;