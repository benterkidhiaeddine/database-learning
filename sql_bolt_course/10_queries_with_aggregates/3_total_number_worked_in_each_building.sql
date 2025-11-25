SELECT SUM(years_employed) as total_years_employed, building
FROM employees
GROUP BY building;