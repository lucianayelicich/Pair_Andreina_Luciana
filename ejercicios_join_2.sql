USE tienda;

-- ejercicio 1 Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).

SELECT e.employee_number, e.first_name, e.last_name, c.customer_number
FROM employees AS e
LEFT JOIN customers AS C
ON e.employee_number = c.sales_rep_employee_number
WHERE c.customer_number IS NOT NULL;

-- ejercicio 2 Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).

SELECT c.customer_number, e.first_name, e.last_name
FROM customers AS c
LEFT JOIN employees AS e
ON e.employee_number = c.sales_rep_employee_number
WHERE e.first_name IS NOT NULL AND e.last_name IS NOT NULL;

-- ejercicio 3 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

SELECT e.first_name, e.last_name, e.employee_number
FROM employees AS e
LEFT JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.first_name, e.last_name, e.employee_number
HAVING COUNT(c.customer_number>8);

-- ejercicio 4 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.

SELECT e.first_name, e.last_name, e.employee_number
FROM employees AS e
RIGHT JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.first_name, e.last_name, e.employee_number
HAVING COUNT(c.customer_number>8);

-- ejercicio 5 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT e.first_name, e.last_name
FROM employees AS e
LEFT JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.first_name, e.last_name
HAVING COUNT(DISTINCT c.country>1);

/* EJERCICIOS EXTRAS */

USE northwind;

-- Ejercicio 1 Empleadas que sean de la misma ciudad:

/*Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. 
Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, 
¿sabes decir quién es el director?*/

SELECT
    e1.EmployeeID AS employee_ID,
    e1.FirstName AS employee1_first_name, 
    e1.LastName AS employee1_last_name,   
    e1.City AS employee_city,
    e1.ReportsTo AS employee_reports
FROM
    Employees AS e1
JOIN
    Employees AS e2
ON
    e1.ReportsTo = e2.EmployeeID;
    

SELECT EmployeeID, FirstName, LastName, City
FROM Employees
WHERE ReportsTo IS NULL;

/* El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados. Queremos 
obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. Podriamos usar un RIGTH JOIN con 'categories'?, 
usemos tambien la tabla 'products'.*/

SELECT c.CategoryID, c.CategoryName, p.ProductName
FROM Categories AS c
LEFT JOIN Products AS p
ON c.CategoryID = p.CategoryID;

SELECT c.CategoryID, c.CategoryName, p.ProductName
FROM Products AS p
RIGHT JOIN  Categories AS c
ON c.CategoryID = p.CategoryID;

-- Se puede usar un RIGHT JOIN comenzanso desde Products, pero el objetivo es listar todas las categorías, así que es más natural y claro 
-- comenzar desde la tabla Categories.LEFT JOIN garantiza que se muestren todas las categorías, y si no tienen productos, el campo 
-- ProductName será NULL.

/* Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes. Sin embargo, 
hay algunos pedidos que pueden no tener un cliente asignado. Necesitamos asegurarnos de incluir todos los pedidos, incluso si no tienen 
cliente registrado*/

SELECT o.OrderID, o.CustomerID, c.CompanyName, c.Country
FROM Orders AS o
LEFT JOIN Customers AS c
ON c.CustomerID = o.CustomerID;

/*El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no. Queremos obtener una lista con todas las 
empleadas y, si han gestionado pedidos, mostrar los detalles del pedido.*/

SELECT o.EmployeeID, o.OrderID, o.CustomerID, o.OrderDate
FROM Employees AS e
LEFT JOIN Orders AS o
ON o.EmployeeID = e.EmployeeID;

/* Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado. Queremos 
asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos.*/

SELECT s.ShipperID, s.CompanyName, o.OrderID, o.OrderDate
FROM Shippers AS s
LEFT JOIN Orders AS o
ON s.ShipperID = o.ShipVia;


