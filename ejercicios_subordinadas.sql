USE tienda;

-- ejercicio 1

SELECT city, COUNT(customer_number)
FROM customers
GROUP BY city;

-- ejercicio 2

SELECT city
FROM (
    SELECT city, COUNT(customer_number) AS clientes
    FROM customers
    GROUP BY city) AS ciudades
ORDER BY clientes DESC
LIMIT 1;

-- ejercicio 3

SELECT customer_number, contact_first_name, contact_last_name, city
FROM customers 
WHERE city = (
		SELECT city
		FROM (
            SELECT city, COUNT(customer_number) AS num_customers
			FROM customers
			GROUP BY city
			ORDER BY num_customers DESC
			LIMIT 1) AS top_city
);

-- ejercicio 4

SELECT 
	employee_number AS 'número empleado',
    first_name AS 'nombre Empleado',
    last_name AS 'apellido Empleado'
FROM employees AS e
WHERE e.employee_number IN (SELECT DISTINCT sales_rep_employee_number
						FROM customers
                        WHERE sales_rep_employee_number IS NOT NULL);




