CREATE DATABASE bdejemplo;

USE bdejemplo;

CREATE TABLE categoria(
	id INT NOT NULL, 
	nombre VARCHAR(50) NOT NULL, 
	CONSTRAINT pk_categoria
	PRIMARY KEY (id)
);


INSERT INTO categoria
VALUES(1, 'Carnes Frias'), 
      (2, 'Vinos y Licores');
      
SELECT * FROM categoria;

-- MANEJO DE VALORES NULOS
USE bdejemplo;
GO

CREATE TABLE alumno (
	idAlumno INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL, 
	apellidoPaterno VARCHAR(20) NOT NULL,
	apellidoMaterno VARCHAR(20) NULL, 
	fechaNaci DATE NOT NULL, 
	calle VARCHAR(50) NOT NULL, 
	numeroInt INT, 
	numeroExt INT
);


INSERT INTO alumno
VALUES (1, 'MONSERRAT', 'MUÑOZ', NULL, '2007-07-17', 'CALLE DEL INFIERNO', NULL, 666);

INSERT INTO alumno
VALUES (2, 'IRVING', 'ANDABLO', 'ISLAS', '2007-06-16', 'CALLE DEL CIELO', NULL, NULL);

INSERT INTO alumno (idAlumno,nombre ,apellidoPaterno, fechaNaci, calle)
VALUES (3, 'Cristofer', 'Garcia', '2007-11-03', 'Conocida');

SELECT *
FROM alumno;


CREATE TABLE categoria2(
	categoriaId INT NOT NULL, 
	nombre VARCHAR(20) NOT NULL, 
	CONSTRAINT pk_categoria2
	PRIMARY KEY (categoriaId)
);

CREATE TABLE producto2 (
	productoid INT NOT NULL PRIMARY KEY, 
	nombre VARCHAR(35) NOT NULL, 
	existencia INT NOT NULL, 
	precio DECIMAL(10,2) NOT NULL, 
	categoriaId INT, 
	CONSTRAINT fk_producto2_categoria2
	FOREIGN KEY (categoriaId)
	REFERENCES categoria2(categoriaId)
);