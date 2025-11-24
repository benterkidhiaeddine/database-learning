SELECT DISTINCT building 
FROM employees
INNER JOIN buildings 
ON employees.building = buildings.building_name  ;