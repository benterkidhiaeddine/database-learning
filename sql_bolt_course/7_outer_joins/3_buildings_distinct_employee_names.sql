SELECT  DISTINCT buildings.building_name  , role 
FROM buildings
LEFT JOIN employees 
ON buildings.building_name = employees.building ;