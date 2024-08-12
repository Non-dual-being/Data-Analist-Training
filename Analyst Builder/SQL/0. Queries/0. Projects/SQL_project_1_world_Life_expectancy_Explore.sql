USE `word_life_expectancy`;

SELECT Country, MIN(`Life expectancy`) , MAX(`Life expectancy`), 
ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`),1) 'upgrades'
FROM tabel
group by Country
HAVING MIN(`Life expectancy`) <> 0
ORDER BY upgrades ASC, Country ASC;

SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM tabel
WHERE `Life expectancy` <> 0
GROUP BY Year
HAVING MIN(`Life expectancy`) <> 0
ORDER BY ROUND(AVG(`Life expectancy`),2) DESC;

SELECT Country, ROUND(AVG(`Life expectancy`),1) 'AVG_Life_expect', ROUND(AVG(GDP),1) 'doekoes'
FROM tabel
WHERE `Life expectancy` <> 0
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0 AND doekoes <> 0
ORDER BY doekoes ASC, ROUND(AVG(`Life expectancy`),1) DESC;
;

SELECT 
AVG(CASE WHEN GDP >=
	(SELECT AVG(GDP) FROM tabel WHERE GDP IS NOT NULL AND GDP <> 0)
    THEN `Life expectancy` ELSE NULL END) 'Life_Exp_High_GDP',
AVG(CASE WHEN GDP < 
	(SELECT AVG(GDP) FROM tabel WHERE GDP IS NOT NULL AND GDP <> 0)
    THEN `Life expectancy` ELSE NULL END) 'Life_Exp_Low_GDP'FROM tabel;


SELECT *
FROM tabel;


SELECT 
AVG(CASE WHEN Status = 'Developing' THEN `Life expectancy` END) 'AVG Developing', 
AVG(CASE WHEN Status = 'Developed' THEN `Life expectancy` END) 'AVG Developed'
FROM tabel
WHERE 'Life expectancy' <> 0;

SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM tabel
WHERE BMI > 0 AND `Life expectancy` > 0
GROUP BY Country
ORDER BY BMI DESC;

SELECT Country, `Life expectancy`, `Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY YEAR) AS Rolling_total
FROM tabel
WHERE Country LIKE '%United%';