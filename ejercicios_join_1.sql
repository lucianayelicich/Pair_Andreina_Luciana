USE tienda;

-- ejercicio 1

SELECT e.first_name, e.last_name, e.employee_number, c.customer_number
FROM employees AS e
CROSS JOIN customers AS c
WHERE e.employee_number = c.sales_rep_employee_number;

-- ejercicio 2

SELECT e.first_name, e.last_name, e.employee_number
FROM employees AS e
CROSS JOIN customers AS c
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY e.first_name, e.last_name, e.employee_number
HAVING COUNT(c.customer_number>8);

-- ejercicio 3

SELECT e.first_name, e.last_name
FROM employees AS e
CROSS JOIN customers AS c
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY e.first_name, e.last_name
HAVING COUNT(DISTINCT c.country>1);

-- ejercicio 4

SELECT e.first_name, e.last_name, e.employee_number, c.customer_number
FROM employees AS e
INNER JOIN customers AS c ON e.employee_number = c.sales_rep_employee_number;


