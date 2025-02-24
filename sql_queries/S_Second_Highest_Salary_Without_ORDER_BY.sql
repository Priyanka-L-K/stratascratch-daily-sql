SELECT DISTINCT salary 
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees)
LIMIT 1;
