
ORDER BY 2;SELECT State_name, City, SUM(Aland), SUM(Awater)
FROM ushouseholdincome
GROUP BY State_name
ORDER BY 4 DESC 
LIMIT 10;

SELECT * FROM `ushouseholdincome` uh
INNER JOIN `statistics` st
	ON uh.id = st.ID
WHERE Mean <> 0;
    
SELECT uh.State_Name, ROUND(AVG(Mean),0), ROUND(AVG(Median),0)
FROM `ushouseholdincome` uh
INNER JOIN `statistics` st
	ON uh.id = st.ID
WHERE Mean <> 0
GROUP BY uh.State_Name
ORDER BY 3 ;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),0), ROUND(AVG(Median),0)
FROM `ushouseholdincome` uh
INNER JOIN `statistics` st
	ON uh.id = st.ID
WHERE Mean <> 0
GROUP BY Type
ORDER BY 4;

