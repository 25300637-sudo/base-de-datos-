--seleccionar la base de datos 
USE NORTHWND;
--mostrar los clientes  de mexico o de almenaia y ademas que sean de Stuttgart
SELECT
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.City,
	c.Country
FROM Customers AS c
WHERE c.Country = 'Mexico'
		OR
		(c.Country = 'Germany'
		AND
		c.City = 'Stuttgart');

	SELECT
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.City,
	c.Country
FROM Customers AS c
WHERE c.Country IN ('Mexico', 'Germany')
	OR c.City = 'Stuttgart';

	SELECT
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.City,
	c.Country
FROM Customers AS c
WHERE c.Country IN ('Mexico', 'Germany');

--mostrar las ventas frealizadas en francia, brasil y belgica 
-- de 10 de julio de 1996 al 31 de diciembre de 1998, pero que tengan region de envio,
--para los clientes VICTE, HANAR Y SUPRD, y ordenados por fecha de pedido de la mas
--cercana a la mas antigua 


SELECT
	o.OrderID AS [numero_orden],
	o.CustomerID AS [cliente],
	o.ShipCountry AS [pais_envio],
	o.OrderDate AS [fecha_pedido],
	UPPER(FORMAT(o.OrderDate, 'MMM', 'es-ES')) AS [mes_pedido],
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_pedido],
	DATEPART(YEAR, o.OrderDate) AS [año_pedido]
FROM Orders AS o
WHERE o.ShipCountry IN ('France', 'Brazil', 'Belgium')
	AND
	o.orderDate BETWEEN '1996-07-10' AND '1998-12-31'
	AND o.ShipRegion IS NOT NULL
	AND
	o.CustomerID IN ('VICTE', 'HANAR', 'SUPRD')
ORDER BY o.OrderDate ;