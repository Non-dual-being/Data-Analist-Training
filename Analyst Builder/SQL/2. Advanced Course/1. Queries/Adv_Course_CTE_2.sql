USE bakery;
SELECT * FROM employees;

WITH RECURSIVE CTE_Example AS
	(SELECT 1 AS x
    
	UNION ALL
    
	SELECT x + 1
	FROM CTE_Example
	WHERE x < 10
	)
SELECT x FROM CTE_Example;

WITH RECURSIVE company_hierarchy AS
(
SELECT employee_id, first_name, last_name, boss_id, 0 AS hierarchy_level
FROM employees
WHERE boss_id IS NULL

UNION ALL

SELECT e.employee_id, e.first_name, e.last_name, e.boss_id, ch.hierarchy_level + 1
FROM employees e, company_hierarchy ch
WHERE e.boss_id = ch.employee_id
)
SELECT * FROM company_hierarchy;

use bakery;
WITH RECURSIVE company_hierarchy AS
(
SELECT employee_id, first_name, last_name, boss_id, 0 AS hierarchy_level
FROM employees
WHERE boss_id IS NULL -- wordt maar 1 keer uitgevoerd

UNION ALL

SELECT e.employee_id, e.first_name, e.last_name, e.boss_id, ch.hierarchy_level + 1
FROM employees e, company_hierarchy ch
WHERE e.boss_id = ch.employee_id -- CTE is eerst alleen de rijen die geen baas hebben en daar kijkt mysql naar de employeetabel en zoekt waar de employee id overeenkommt boss boss_id uit stap 1 en dan kijkt msql naar alle emp uids uit niveau van de CTE
)
SELECT ch.first_name 'first_name_emp', e.last_name 'last_name_emp', e.first_name 'first_name_boss', e.last_name 'last_name_boss', ch.hierarchy_level
FROM company_hierarchy ch
JOIN employees e
	ON ch.boss_id = e.employee_id
ORDER BY ch.hierarchy_level

