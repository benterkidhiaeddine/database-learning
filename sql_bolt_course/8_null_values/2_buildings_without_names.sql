SELECT * 
FROM buildings
LEFT JOIN employees
ON buildings.building_name = employees.building
WHERE employees.name IS NULL;