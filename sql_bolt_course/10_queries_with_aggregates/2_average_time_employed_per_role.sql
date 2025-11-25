SELECT role, AVG(years_employed) as Average_years_employed
FROM employees
GROUP BY role;