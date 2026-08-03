-- Alter 

CREATE DATABASE escuelita;
GO
USE escuelita;

CREATE TABLE alumno(
	alumno_id INT IDENTITY (1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR (15) NOT NULL,
	apellido_materno VARCHAR(15),
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO

-- Agregar una columna a una tabla existente
ALTER TABLE alumno
ADD telefono VARCHAR(20);
GO
-- Agregar varias columnas a varias columnas
ALTER TABLE alumno
ADD
curp CHAR(18),
rfc CHAR(13);
-- Modificar el tipo de dato 
ALTER TABLE alumno
ALTER COLUMN
telefono VARCHAR(20) NOT NULL;
GO

CREATE TABLE alumno2(
	alumno_id INT IDENTITY (1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR (15) NOT NULL,
	apellido_materno VARCHAR(15)
);
GO
-- Agregar una PRIMARY KEY
ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY (alumno_id);



CREATE TABLE carrera(
carrera_id INT IDENTITY (1,1)
CONSTRAINT	pk_carrera
PRIMARY KEY (carrera_id),
nombre VARCHAR(10) NOT NULL
);
-- Agregar un campo par foreign key en alumno 
ALTER TABLE alumno 
ADD 
carrera_id INT;

-- Agregar  restriccion foreing key
ALTER TABLE alumno 
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera (carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- Afregar campo edad ala tabla alumno 
ALTER TABLE alumno 
ADD 
edad INT;
-- Agregar una restriccion check 
ALTER TABLE alumno 
ADD CONSTRAINT ck_alumno_edad
CHECK (edad>=18);
GO

-- DWFAULT
ALTER  TABLE  alumno
ADD activo BIT NOT NULL;

SELECT *
FROM alumno;

ALTER TABLE alumno
ADD CONSTRAINT df_alumno_activo
DEFAULT 1
FOR activo;
GO

-- Eliminar Restricciones

-- EXEC sp_help alumno;

-- Consulta para conocer los tipos y nombres de las restricciones de una tabla 

SELECT
	o.name AS nombre_restriccion,
	o.type_desc AS tipo_restriccion
FROM sys.objects AS o
WHERE o.parent_object_id = OBJECT_ID('alumno')
AND o.type IN ('PK', 'F', 'UQ', 'C', 'D')
ORDER BY o.type_desc;
GO
-- Eliminar PK
ALTER TABLE alumno
DROP CONSTRAINT pk_alumno;

-- Eliminar un Check
ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_edad;

-- Eliminar un UQ

ALTER TABLE alumno
ADD matricula VARCHAR(12) NOT NULL;

ALTER TABLE alumno
ADD CONSTRAINT uq_alumno_matricula
UNIQUE (matricula);

ALTER TABLE alumno
DROP CONSTRAINT uq_alumno_matricula;

-- Eliminar el df
ALTER TABLE alumno
DROP CONSTRAINT df_alumno_activo;

-- Eliminar la FK
ALTER TABLE alumno
DROP CONSTRAINT fk_alumno_carrera;

-- DROP (Eliminar  objetos completos )

-- Muestra las tablas de la base de datos 
SELECT name
FROM sys.tables;


DROP TABLE alumno;
go
DROP TABLE alumno2;
GO
DROP TABLE carrera;
GO

USE master;
GO



DROP DATABASE escuelita;
GO

SELECT *
FROM alumno;