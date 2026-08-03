/*=============================================================
DQL (Data query lenguage)
Archidatabase.sqlo: 01-create-database.sql
base de datos: cimercial_db

Descripcion: crea la base de datos de la `practica del lenguaje


============================================================================*/

USE master;
GO

IF DB_ID ('comercial_db') IS NOT NULL
BEGIN
	ALTER DATABASE comercial_db
	SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE;

	DROP DATABASE comercial_db;
END;
GO

CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

PRINT 'Base de datos comercial_db creada correctamente'

SELECT DB_ID ('comercial_db') 