SELECT role, SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = "Engineer";