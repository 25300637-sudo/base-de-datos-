CREATE TABLE alumno(
  alumno_id INT IDENTITY (1,1),
  nombre VARCHAR (20) NOT NULL,
  apellido_paterno VARCHAR (15) NOT NULL,
  apellido_materno VARCHAR (15),
  CONSTRAINT pk_alumno 
  PRIMARY KEY (alumno_id)
 );
 GO 

 -- Agregar una columna a una tabala existente
 ALTER TABLE alumno
 ADD telefono VARCHAR (20);
 GO

 -- A gregar varias columnas 
 ALTER TABLE alumno 
 ADD
 crup CHAR (18),
 rfc CHAR (13);

 -- Modificar el tipo de dato 
 ALTER TABLE alumno
 ALTER COLUMN 
 telefono VARCHAR (30) NOT NULL;
 GO 

  CREATE TABLE alumno2(
  alumno_id INT IDENTITY (1,1),
  nombre VARCHAR (20) NOT NULL,
  apellido_paterno VARCHAR (15) NOT NULL,
  apellido_materno VARCHAR (15),
 );
 GO


-- DEAULT
ALTER TABLE  alumno
ADD activo BIT NOT NULL;
GO

ALTER TABLE alumno
ADD CONSTRAINT f_alumno_activo
DEFAULT 1
FOR activo;
GO

--eliminar restricciones 
-- EXEC sp_help alumno;
-- consulta para conices y los tipos de nom bres de las restricciones de una tabla 

SELECT 1
o.name AS nombre_restricciones,
 o.type_desc AS tipo_restriccion 
 FROM sys.objects AS o 
 WHERE o.parent_object_id = OBJECT_ID('alumno')
 AND o.type IN ('PK' , 'F' , 'UQ', 'C', 'D')
 ORDER BY o.TYPE_DESC;

 --eliminar pk 
 ALTER TABLE alumno
 DROP CONSTRAINT 
 --elIMINAR UN CHECK
 ALTER TABLE alumno
 DROP CONSTRAINT ck_alumno_edad;

 -- eliminar un	UNIQUE	
 ALTER TABLE alumno
 ADD matricula VARCHAR(12) NOT NULL;

 ALTER TABLE alumno
 ADD CONSTRAINT uq_alumno_matricula
 UNIQUE (matricula);

 --eliminar default

 ALTER TABLE alumno
 DROP CONSTRAINT df_alumno_activo;

 --eliminar fk
 
 ALTER TABLE alumno
 DROP CONSTRAINT df_alumno_carrera;


 --- DROP (eliminar objetos completos ) 


 -- muestra las tablas de la base de datos 
 SELECT name 
 FROM sys.tables;

