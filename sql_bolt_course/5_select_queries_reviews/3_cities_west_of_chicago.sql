
-- -87.629798 Is the longitude of the city of chicago all cities west of have a smaller longitude

SELECT * FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;
