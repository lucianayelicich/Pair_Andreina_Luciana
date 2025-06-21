/*Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.*/

/*SELECT
    country -- Seleccionamos la columna 'country' de la tabla 'customers'
FROM
    customers -- Desde la tabla 'customers'
UNION -- Combinamos los resultados, eliminando duplicados
SELECT
    country -- Seleccionamos la columna 'country' de la tabla 'offices'
FROM
    offices; -- Desde la tabla 'offices'*/


USE tienda

SELECT
	last_name AS 'Apellidos'
FROM
	employees
UNION -- elimina los duplicados
SELECT
	contact_last_name AS 'Apellidos'
FROM
	customers;
    
SELECT
	last_name AS 'Apellidos'
FROM
	employees
UNION ALL -- inlcuye duplicados
SELECT
	contact_last_name AS 'Apellidos'
FROM
	customers;
    
/*Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.*/
	
SELECT
	first_name AS 'Nombre',
	last_name AS 'Apellidos'
FROM
	employees
UNION -- elimina los duplicados
SELECT
	contact_first_name AS 'Nombre',
	contact_last_name AS 'Apellidos'
FROM
	customers;
    
/*Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.*/

SELECT
	first_name AS 'Nombre',
	last_name AS 'Apellidos'
FROM
	employees
UNION ALL
SELECT
	contact_first_name AS 'Nombre',
	contact_last_name AS 'Apellidos'
FROM
	customers;
    
/*Queremos ver ahora el employee_number como 'Número empleado', first_name como 'nombre Empleado' y last_name como 'Apellido Empleado' 
para los empleados con employee_number: 1002,1076,1088 y 1612.*/

SELECT
    employee_number AS 'Número empleado', 
    first_name AS 'Nombre Empleado',
    last_name AS 'Apellido Empleado'
FROM
    employees
WHERE
    employee_number IN (1002, 1076, 1088, 1612);
    
/*Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, que no estén en: Ireland, France, Germany.*/

SELECT
    city AS 'Ciudad',
    customer_name AS 'Nombre de la empresa'
FROM
    customers
WHERE
    city NOT IN ('Ireland', 'France', 'Germany');
    
/*Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.*/

SELECT
    city AS 'Ciudad',
    customer_name AS 'Nombre de la empresa'
FROM
    customers
WHERE
    city REGEXP 'on$'; -- con % no funciona
    
/*
Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.*/

SELECT
    city AS 'Ciudad',
    customer_name AS 'Nombre de la empresa'
FROM
    customers
WHERE
    city LIKE '__on';
    
/*
Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal
(o lo que es lo mismo, su primera dirección).*/

SELECT
	customer_name AS 'Nombre del cliente',
    city AS 'Ciudad',
    address_line1 AS 'Dirección postal'
FROM
    customers
WHERE
    address_line1 LIKE '%3%';
    
/*
Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.*/

SELECT
	customer_name AS 'Nombre del cliente',
    city AS 'Ciudad',
    address_line1 AS 'Dirección postal'
FROM
    customers
WHERE
    address_line1 LIKE '%3%' AND city NOT LIKE 'T%';
    
/*Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. 
Unicamente en el caso que la dirección postal, posea algún número en dicho campo.*/

SELECT
	customer_name AS 'Nombre del cliente',
    city AS 'Ciudad',
    address_line1 AS 'Dirección postal'
FROM
    customers
WHERE 
	address_line1 REGEXP '[0-9]'; /*buscar numeros/*
