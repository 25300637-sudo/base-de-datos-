/*=======================================================

tema: consulyas basicas con select

archivo: 05-bsic-queries.sql

descripcion: desarrollar la capacidad para construir consultas basicas mediante SELECT 



=============================================================0*/

USE comercial_db;
GO

/*
uso de select  *

Sintaxis:

SELECT * 
FROM nombre_tabla;

NOTA: el asterisco significa todas las columnas de una tabla
(no es tan recomendado su uso)

por que no se recomienda utilizarlo siempre 

1. recupera informacion innecesaria 
2. reduce la claridad de la consulta 
3.puede aumentar el recurso de consumps 

===============================================================*/

--seleccionar todos registros y campos de ña tabla productos 

SELECT *
FROM productos;

--proyeccion

SELECT codigo,
	   nombre,
       precio
FROM productos;
GO

--ALTAS DE COLUMNA 
--in alias de columna es un nombre temporal asignado a una columna 
-- dentro del resultado de una columna 

SELECT codigo,
	   nombre,
       precio
FROM productos;

SELECT codigo AS codigo_producto,
	   nombre AS nombre_producto,
       precio AS precio_producto
FROM productos;
GO 

SELECT codigo AS [codigo producto],
	   nombre AS [nombre producto],
       precio AS [precio producto]
FROM productos;
GO

SELECT codigo AS 'codigo producto',
	   nombre AS 'nombre producto',
       precio AS 'precio producto'
FROM productos;
GO

SELECT codigo AS [codigo producto],
	  UPPER (nombre) AS 'nombre producto',
       precio AS precio_producto
FROM productos;
GO 

--ALIAS DE TABLA 
--tambuen se peude asignar un alias temporal a una tabla 

--sintaxis 

/*
select alias_tabla _columna
FROM nombre_tabla as alias_tabla 

*/

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos ;

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p; 
GO

SELECT c.id_categoria,
	   c.nombre, 
	   p.id_producto,
	   p.nombre,
	   p.precio,
	   p.existencia
FROM categorias AS c
INNER JOIN productos AS p
ON c.id_categoria = p.id_categoria;
GO

SELECT c.id_categoria as [#Categoria],
	   c.nombre[Nombre Categoria], 
	   p.id_producto[#Producto],
	   p.nombre[Nombre Producto],
	   p.precio,
	   p.existencia
FROM categorias AS c
INNER JOIN productos AS p
ON c.id_categoria = p.id_categoria;
GO
--campos calculados - columnas calculadas 
--una columna calculada es el resultado de una expresion incluida en la 
--listra de seleccion
--no existe fisicamente en la tabla 

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	p.existencia * p.precio AS valor_inventario
FROM productos AS p; 

--seleccionar el nombre, apellido paterno,salario y simular 
--como quedaria el salario del empleado si resiviera un 
--aumento fijo de mil pesos, el campo se debe llamar salario_simulador 

SELECT
	e.nombre,
	e.apellido_paterno,
	CONCAT(e.nombre,' ', e.apellido_paterno,' ', apellido_materno)
	AS nombre_completo,
	YEAR(e.fecha_ingreso) AS año_ingreso,
	MONTH(e.fecha_ingreso) AS mes_ingreso,
	DAY(e.fecha_ingreso) AS dia_ingreso,
	e.fecha_ingreso,
	e.salario,
	(e.salario + 1000) AS salario_simulado
	FROM empleados AS e;
	GO

	--mostrar de una venta cual es su numero, cantidad vendida, precio,
	--descuento, importe_bruto (cantidad por el precio ) y ademas el
	--iporte con decsuento (importe_bruto por el descuento dividido entre 100)

	SELECT 
		dv.id_detalle_venta,
		dv.cantidad,
		dv.precio,
		dv.descuento,
		dv.cantidad * dv.precio AS importe_bruto,
		(dv.cantidad * dv.precio * dv.descuento / 100.0) AS importe_descuento
	FROM detalle_venta AS dv


/*=============================================
OPERADORES ARITNETICOS EN SQL SERVER 

+SUMA
-RESTA
*MULTIPLICACION
/DIVISION
%MODULO - RESIDUO DE DIVISION 
===============================================*/

--uso de la clausula DISTINCT

--elimina del resultado las filas que tengan valores repetidos en todas
--las columnas seleccionadas 

SELECT c.sexo
FROM clientes  AS c;


SELECT COUNT(c.sexo) AS cantidad_sexo
FROM clientes  AS c;


SELECT DISTINCT sexo
FROM clientes  AS c;


SELECT COUNT (DISTINCT sexo) AS numero_sexos
FROM clientes  AS c;

SELECT COUNT(sexo) AS [mujeres]
FROM clientes
WHERE sexo = 'M';

--seleccionar los distintos descuentos que se realizan a las ventas 
SELECT DISTINCT descuento
FROM detalle_ventas
ORDER BY descuento DESC;

-- TODO: DISTINC CON MAS DE UN CAMPO 
