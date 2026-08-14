/*===============================================
Tema= Filtrado de registro con WHERE


archivo: 06-filtrado_were.sql

Descripcion: en este tema se filtran registros mediante, condiciones,
comparaciones, operadores logicos y busquedas de patrones.

===============================================*/

--seleccionar columnas y filtrar filas

SELECT
	 codigo,
	 nombre,
	 precio
	FROM productos;

	--mostrar los productod con un precio mayor a 40

	SELECT
	 codigo,
	 nombre,
	 precio
	FROM productos
	WHERE precio > 400;

	-- mostrar el producto cuyo precio es exactamente 200

SELECT
	p.codigo AS [codigo],
	p.nombre,
	p.precio
FROM productos AS p
WHERE precio = 200;
	
	--seleccionar los datos del cliente 25

SELECT
	c.id_cliente,
	c.nombre,
	c.apellido_paterno,
	c.correo
FROM clientes AS c
WHERE id_cliente = 25;

-- comparacion de cadenas de texto

--los valores de texto deben escribirse entre comillas
--simples 

--seleccionar todas las catewgorias, donde el
-- nombre sea computo

SELECT
	c.id_categoria,
	c.nombre
FROM categorias AS c
WHERE c.nombre = 'còmputo';

--mostarr los datos de los empleados que no pertenezcan
--al depafrtamento 1 (numero de empleado, nombre, salario y 
--numero del departamento)


SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE id_empleado <> 1;

--seleccionar los productos cuyo precio sea superior a 450,
--codigo, nombre, precio, existencia, utilizar alias de columnas
--y de tabla 



SELECT
	p.precio,
	p.nombre,
	p.existencia,
	p.codigo
FROM productos AS p
WHERE precio > 450;


SELECT
	p.codigo AS [codigo],
	p.nombre AS [nombre producto],
	p.precio,
	p.existencia,
	p.codigo
FROM productos AS p
WHERE precio <> 450;

SELECT
	p.codigo AS [codigo],
	p.nombre AS [nombre producto],
	p.precio,
	p.existencia,
	p.codigo
FROM productos AS p
WHERE precio <= 450;


SELECT
	p.codigo AS [codigo],
	p.nombre AS [nombre producto],
	p.precio,
	p.existencia,
	p.codigo
FROM productos AS p
WHERE precio >= 450;

--FILTRAR FECHAS 
--las fechas deben escribirse entre comillas simples

--se recomienda utilizar el formato AAAA-MM-DD

--  seleccionar todas las ventas frealizadas el 24 de diciembre de 2024,
-- mostrar numero de venta , fecha de venta clinte l que se vendio
--y el empleado al que lo vendio


SELECT
	v.id_venta AS [Numero de venta],
	v.fecha AS [fecha venta],
	v.id_cliente AS [cliente],
	v.id_empleado AS [empleado]
FROM ventas AS v
WHERE fecha = '2025-12-24';


SELECT
	v.id_venta AS [Numero de venta],
	v.fecha AS [fecha venta],
	v.id_cliente AS [cliente],
	v.id_empleado AS [empleado]
FROM ventas AS v;
INNER JOIN
clientes AS c
ON v.id_cliente = c.id_cliente
INNER JOIN 
empleados AS e
ON v.id_empleado = e.id_empleado 
WHERE fecha = '2025-12-24';

--seleccionar todas las ventas anteriores al 1 de febrero de 2025

SELECT
	v.id_venta AS numero_venta,
	v.fecha AS [fecha de venta],
	v.id_cliente cliente
FROM ventas AS v
WHERE v.fecha < '2025-02-01';
GO

-- sele cionar todas la ven ras de 1 de octubre de 2025
-- en adelante 

SELECT
	v.id_venta AS numero_venta,
	v.fecha AS [fecha de venta],
	v.id_cliente cliente
FROM ventas AS v
WHERE v.fecha >= '2025-02-01';
GO

--COMPRACIONES CON EXPRESIONES CALCULADAS 

--seleccionar los productos cuyo valor del inventqrio dea mayor
--a $50000

--valor_inventario = precio * existencia 
-- nota: sql server no reconoce el valor del alias dentro del where 
--en el muismo nivel de consulta, esto ocurre po rl orden logico de en qsl server procesa las partes de una consulta 

-- orden de ejecucion
/*=============================================
 FROM/JOIN
 WHERE
 GROUP BY
 HAVING
 SELECT
 DISTINC 
 ORDER BY
 TOP
 ================================================*/
 
-- orden de escritura
/*=============================================
 SELECT/ TOP
 FROM / JOIN
 WHERE

 ================================================*/


SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	((precio + 10) * existencia)  AS valor_inventario
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY valor_inventario DESC;

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	((precio + 10) * existencia)  AS valor_inventario
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY (precio * existencia) DESC;


SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	((precio + 10) * existencia)  AS valor_inventario
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY p.precio;

/*CONSULTA CON OPERADORES LOGICOS (NOT, AND OR) */

--operador logico AND

/*
  CONDICION 1  CONDUCION2 RESULTADO
  TRUE             TRUE      TRUE
  TRUE              FALSE    FALSE
  FALSE             TRUE     FALSE
  FALSE              FALSE    FALSE

  */

  --MOSTRAR PRODUCTOS CON PRECIO ENTRE $200 Y $300 QUE ADEMAS
  -- TENGAN MENOS DE 50 UNIDADES

  SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE precio>=200.0
	AND p.precio<=300.0
	AND p.existencia < 50.0;


	--selccionar los empleados del depatamento 1 cuyo salario sea superior a $25.0

	SELECT
		e.id_empleado,
		CONCAT(e.nombre), ' ',
		e.apellido_paterno, ' ',
		e.apellido_materno)	AS [nombre_completo],
		e.id_departamento AS departamento,
		e.salario
	FROM emplados AS e 
	WHERE e.id_departamento = 1
		AND e.salario > 25.0;

		--operador logico OR
/*==========================================00

OR reqyiere que al menos una condicion sea verdadera



 CONDICION 1  CONDUCION2 RESULTADO
  TRUE             TRUE      TRUE
  TRUE              FALSE    FALSE
  FALSE             TRUE     FALSE
  FALSE    

  =====================================*/
  -- seleccionar los productos con existencia inferior a 10 o superior
  -- a 190

  SELECT TOP 15
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE p.existencia < 10
  OR p.precio > 190
  ORDER BY nombre DESC;

  --opetrador logico NOT 

  /*==========================================00

NOT niega una condicion 
 CONDICION 1  resultado
 TRUE           FALSE
 FALSE          TRUE

  =====================================*/

  --seleccionar los productos no sea mayor a $400

  
  SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE NOT p.precio > 400;

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE NOT p.precio <= 400
  ORDER BY p.precio DESC;
  WHERE 
  NOT(precio>=100 AND precio<=400);

  -- Mostrar los productos que no encuentran dentro del 
  -- rango de $100 a $400

  --mostrar los empleados de los departamentos 1 o 2 tengan 
  --salario mayor a $25,000

  --	TODO: Instruccion BETWEEN E IN, LIKE, COMPARACIONES CON NULL 

  --OPERADOR BETWEEN:
  --PERMITE COMPROBAR SI UN VALOR SE ENCUENTRA DENTRO DE UN RANGO INCL8SIVO

  --sintaxis  
  --WHERE columna BETWEEN limite_inferior AND limite_superior;

  --mostrar empleados con salario entre $15000 y $20000

  SELECT
	e.id_empleado,
	e.nombre,
	e.salario
  FROM empleados AS e
  WHERE e.salario BETWEEN 15000 AND 20000;

  SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario>=15000
AND e.salario <=20000;

--seleccionar las ventas del primero de enero del 2025 al
-- 10 de enero de 2025

SELECT
	v.id_venta,
	v.fecha,
	FORMAT (v.fecha, 'MM') AS [ Mes en Digito],
	FORMAT(v.fecha, 'MMM') AS [Nombre Mes],
	FORMAT(v.fecha, 'dd') AS [Dia en Digito],
	FORMAT(v.fecha, 'dddd') AS [Nombre Del Dia En Ingles],
    UPPER(v.fecha, 'MMM', 'es-ES') AS [Nombre del Mes Español],
	UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES')) AS [Nombre del Dia Español],
	DATEPART(MONTH, v.fecha) AS [Mes del Año],
	v.id_cliente
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10';

--seleccionar los productos que no encue tren en e ramgo de precios 
--de $100 a $400

SELECT
	p.id_producto,
	p.nombre,
	p.precio
FROM productos AS p
WHERE precio NOT BETWEEN 100 AND 400;

--OPERDOR IN
--permite comprar una columna con una lista de valires 
--sintaxis : WHERE columna IN (valor_1, valor_2, valor_n);
--equivalee a varias condiciones OR conectadas

*--mostrar los productos pretenecientes a la categoria 1,7,12

SELECT
	p.id_producto,
	p.nombre,
	p.precio,
	p.id_categoria
	FROM productos  AS p
	WHERE p.id_categoria = 1
	OR
 p.id_categoria = 7
 OR
  p.id_categoria = 12;


  SELECT 
	p.id_producto,
	p.nombre,
	p.precio,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12);

--seleccionar los satos de los clientes 1, 10, 25, 50, 100

SELECT 
	c.id_cliente,
	c.nombre,
	c.correo
FROM clientes AS c
WHERE id_cliente IN (  1, 10, 25, 50, 100);

--seleccionar los datos de los departamentos de ventas, TI odireccion 

SELECT
	d.id_departamento AS numero,
	d.nombre AS nombre_departamento
FROM departamentos AS d
WHERE d.nombre IN ('ventas', 'TI' , 'direccoin' );

-- seleccionar todos los departamentos que no correspondan 

	
SELECT
	d.id_departamento AS numero,
	d.nombre AS nombre_departamento
FROM departamentos AS d
WHERE d.id_departamento NOT IN (1,2);

SELECT 
	d.id_departamento AS numero,
	d.nombre AS nombre_departamento
FROM departamentos AS d
WHERE
	NOT (d.id_departamento = 1
	OR
	d.id_departamento = 2);


--PRECAUCION CON NOT IN Y NULL.
--cuando una columna contiene NULL , una comparacion con NOT IN puede comportarse
-- de manera diferente a lo esperado 

--seleccionar todos los empleados que no tenmgan jefe 
SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe 
FROM empleados AS e
WHERE id_jefe IS NULL ;

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe 
FROM empleados AS e
WHERE e.id_jefe NOT IN (1,2,3) 
	OR e.id_jefe IS NULL;

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe 
FROM empleados AS e
WHERE NOT(e.id_jefe = 1
	OR e.id_jefe = 2
	OR e.id_jefe = 3)
	OR e.id_jefe IS NULL


SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe 
FROM empleados AS e
WHERE NOT(
		e.id_jefe IS NOT NULL)

		
SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe 
FROM empleados AS e
WHERE NOT( e.id_jefe =1
          OR 
		  e.id_jefe IS NOT NULL)


SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe 
FROM empleados AS e
WHERE 
		e.id_jefe =1
          OR 
		  e.id_jefe IS NOT NULL


SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe 
FROM empleados AS e
WHERE 
		NOT( e.id_jefe IS NOT NULL
          OR 
		  e.id_jefe = 4 );

--OPERADOR LIKE 
--permite buscar patrones dentro de valores de tec¡xto

--	SINTAXIS 
--WHERE columna LIKE 'patron'

--los patrones son 

--comodin   significado
-- %         cero, uno o varios caracteres 
-- _		EXACTAMENTE UN CARACTER 
-- [abc]     un caracter incluido en la lista 
-- [a-f]     un caracter incluido en el rango 
-- [abc]     un caracter no incluido en la lista 


--seleccionar los datos de los productos donde el codigo ncomience con
--P001

SELECT
	*
	FROM productos
	WHERE codigo  LIKE 'P001%'

		   