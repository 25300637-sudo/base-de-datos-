-- crea una base de datos
CREATE DATABASE universidad;
GO

-- utilizaR LA BASE DE DATOS
USE universidad;
GO

--   crear una tabla
CREATE TABLE alumno (
alumno_id INT,
nombre VARCHAR (100),
edad INT
);
GO

CREATE TABLE alumno_2(
	alumno_id INT,
	nombre VARCHAR(50),
	apellido_paterno VARCHAR(50),
	apellido_materno VARCHAR(50),
	fecha_nacimiento DATE,
	correo VARCHAR (45)
);
GO

-- Restricciones
CREATE TABLE alumno_3(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(100),
	correo VARCHAR(40)
);
GO

CREATE TABLE alumno_4(
	alumno_id INT NOT NULL,
	nombre VARCHAR(100),
	correo VARCHAR(40)
	CONSTRAINT pk_alumno_4
	PRIMARY KEY (alumno_id)
);
GO

INSERT INTO alumno_4
VALUES (1, 'PANFILO', 'correo@correo.com')

INSERT INTO alumno_4
VALUES (2, 'Monico', 'correo2@correo.com')

-- Primary key con IDENTITY
CREATE TABLE profesor(
profesor_id INT NOT NULL IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
edad INT NULL,
CONSTRAINT pk_profesor
PRIMARY KEY (profesor_id)
);
GO
INSERT INTO profesor
VALUES ('German',29),
		('Maricha', 22);

SELECT *
FROM profesor;

-- Restriccion Unique
CREATE TABLE materia(
msteris_id INT NOT NULL IDENTITY(1,1),
correo VARCHAR(50)NOT NULL UNIQUE 
);


CREATE TABLE materia_2(
msteria_id INT NOT NULL IDENTITY(1,1),
correo VARCHAR(50)NOT NULL,
CONSTRAINT pk_materia_2
PRIMARY KEY (msteria_id),
CONSTRAINT uq_materia_2_correo
UNIQUE (correo)

);
GO


INSERT INTO materia_2
VALUES ('correo@correo.com');

INSERT INTO materia_2
VALUES ('correo2@correo.com');

-- Restriccion Default

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL UNIQUE,
	activo BIT DEFAULT 1	
);
GO

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL 
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1	
);
GO


CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR(30) NOT NULL,
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1,
	CONSTRAINT pk_categoria 
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre
	UNIQUE(nombre)
	
);


	DROP TABLE categoria;



INSERT INTO categoria
VALUES ('Carnes Frias', 1);

INSERT INTO categoria
VALUES ('Carnes Calinetes', DEFAULT);

INSERT INTO categoria (nombre)
VALUES ('Chochos');

-- Restriccion Check
-- Opcion de construccion 1
CREATE TABLE producto(
	producto_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL (10,2) NOT NULL CHECK (precio>0),
	existencia INT NOT NULL CHECK (existencia>0 AND existencia<=100),
	activo BIT  NOT NULL DEFAULT 1
);
GO

INSERT INTO producto
VALUES(1,'PITUFO',NULL, 200, 99, 0);

INSERT INTO producto
VALUES(2,'Quemadita',NULL, 200, 100, DEFAULT);

INSERT INTO producto (producto_id,nombre, existencia, precio)
VALUES(3,'Pantera Rosa', 47, 80);

-- Opcion de construccion 2
CREATE TABLE producto(
	producto_id INT IDENTITY(1,1) 
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio>0),
	existencia INT NOT NULL
	CONSTRAINT ck_producto_existencia
	CHECK (existencia>0 AND existencia<=100),
	activo BIT  NOT NULL 
	CONSTRAINT df_producto_activo
	DEFAULT 1
);
GO

-- Opcion de construccion 2
CREATE TABLE producto (
producto_id INT NOT NULL,
nombre VARCHAR(20) NOT NULL,
descripcion VARCHAR(80),
precio DECIMAL(10,2) NOT NULL,
existencia INT NOT NULL,
activo BIT NOT NULL
CONSTRAINT df_producto_activo
DEFAULT 1,
-- Restriccion pk
CONSTRAINT pk_producto
PRIMARY KEY(producto_id),
-- Restriccion UNIQUE
CONSTRAINT uq_producto_nombre
UNIQUE (nombre),
-- Restriccion para precio 
CONSTRAINT ck_producto_precio
CHECK (precio>0.0),
-- Restriccion check para existencia
CONSTRAINT ck_producto_existencia
CHECK(existencia BETWEEN 1 AND 100)

);
GO


DROP TABLE producto;
GO

SELECT* 
FROM producto;

--Crear una base de datosv Empresa Patito

--CREAR BASE DE DATOS 
CREATE DATABASE empresa_patito;

--usar la base de datos
USE empresa_patito;
GO

-- Restriccion DE FOREIGN KEY
 CREATE  TABLE probedor (
 provedor_id INT NOT NULL  IDENTITY(1,1),
 empresa VARCHAR(35) NOT NULL,
 direccion VARCHAR(80 )NULL,
 limite_credito DECIMAL(10,2) NOT NULL,
 -- PRIMARY KEY
 CONSTRAINT pk_provedor
 PRIMARY KEY(provedor_id),
 -- UNIQUE
 CONSTRAINT uq_provedor_empresa
 UNIQUE (empresa),
 -- CHECK limite_credito
 CONSTRAINT ck_provedor_limite_credito
 CHECK (limite_credito >0.0 AND limite_credito <=100000)
 );
 GO

 CREATE TABLE  producto(
 fabricante_id CHAR(3) NOT NULL,
 producto_id INT NOT NULL,
 nombre VARCHAR(20) NOT NULL
 CONSTRAINT uq_producto_nombre
 UNIQUE,
 stock INT NOT NULL
 CONSTRAINT ck_producto_stock
 CHECK (stock BETWEEN 1 AND 100),
 precio DECIMAL(10,2) NOT NULL
 CONSTRAINT ck_producto_precio
 CHECK (precio >0.0),
 activo BIT NOT NULL
 CONSTRAINT df_producto_activo
 DEFAULT 1,
 provedor_id INT NOT NULL,
 CONSTRAINT pk_producto
 PRIMARY KEY (fabricante_id, producto_id),
 CONSTRAINT fk_producto_provedor
 FOREIGN KEY (provedor_id)
 REFERENCES probedor (provedor_id)

 );

 -- Integrales referenciales on  DELETE Y ON UP DATE
 -- NO ACTION, CASCADE, SERT NULL , SET DEFAULT
  CREATE DATABASE construccion;
  GO
  USE construccion;
  GO

  -- NO ACTION 
  CREATE TABLE cliente(
  cliente_id INT 
  CONSTRAINT pk_cliente
  PRIMARY KEY,
  empresa VARCHAR (20)
  CONSTRAINT uq_cliente_empresa
  UNIQUE,
  direccion VARCHAR(50),
  telefono VARCHAR(15)NOT NULL,
  activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at  DATETIME2 NOT NULL
	DEFAULT SYSDATETIME()
  );
  GO


  CREATE TABLE telefono(
  telefono_id INT IDENTITY (1,1),
   numero_telefono VARCHAR(15)NOT NULL,
   created_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_created_at
   DEFAULT SYSDATETIME(),
   updated_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_updated_at
   DEFAULT SYSDATETIME(),
   cliente_id INT,
   CONSTRAINT pk_telefono
   PRIMARY KEY (telefono_id),
   CONSTRAINT uq_telefono_numero_telefono
   UNIQUE (numero_telefono),
   CONSTRAINT ck_telefono_numero_telefono_id
   CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
   CONSTRAINT fk_telefono_cliente
   FOREIGN KEY (cliente_id)
   REFERENCES cliente (cliente_id)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
   );
  GO

  INSERT INTO cliente
  VALUES (1, 'Patito de Hule', NULL ,'773-DEF-123', 1, DEFAULT, DEFAULT );

   INSERT INTO cliente(cliente_id,empresa,telefono,activo)
  VALUES (2, 'Taqueria Mr.Linux',  '7731234567',1 );
   
   INSERT INTO telefono(numero_telefono,cliente_id)
   VALUES ('11-345-2347', 1);


   INSERT INTO telefono(numero_telefono,cliente_id)
   VALUES ('111-345-3456', 1),
		  ('255-678-2345', 1),
		  ('123-768-2345', 1),
		  ('773-143-2476', 2);




	SELECT
	* FROM cliente;
	SELECT*
	FROM telefono;

	-- ACTUALIZA ON UO DATE EN NO ACTION 

	-- A ctualiza el hijo (poniendo en nulo)
	UPDATE telefono
	SET  cliente_id =NULL
	WHERE cliente_id=2;

	-- Actualiza el padre

	UPDATE cliente
	SET cliente_id=3
	WHERE cliente_id=2;
	--  ACTUALIZA EL HIJO CON EL NUEVO ID PADRE
	UPDATE telefono 
	SET cliente_id=3
	WHERE  cliente_id IS NULL;

	-- elminiar  con ON DELETE NO ACTION
	--- Elimina los hijos
	DELETE FROM telefono
	WHERE cliente_id=1;
	-- Eliminar padre
	DELETE FROM cliente
	WHERE cliente_id=1;

	-- Integrridad referenciA ON DELETE Y ON UPDATE CASCADE
	CREATE TABLE cliente(
  cliente_id INT 
  CONSTRAINT pk_cliente
  PRIMARY KEY,
  empresa VARCHAR (20)
  CONSTRAINT uq_cliente_empresa
  UNIQUE,
  direccion VARCHAR(50),
  telefono VARCHAR(15)NOT NULL,
  activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at  DATETIME2 NOT NULL
	DEFAULT SYSDATETIME()
  );
  GO


  CREATE TABLE telefono(
  telefono_id INT IDENTITY (1,1),
   numero_telefono VARCHAR(15)NOT NULL,
   created_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_created_at
   DEFAULT SYSDATETIME(),
   updated_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_updated_at
   DEFAULT SYSDATETIME(),
   cliente_id INT,
   CONSTRAINT pk_telefono
   PRIMARY KEY (telefono_id),
   CONSTRAINT uq_telefono_numero_telefono
   UNIQUE (numero_telefono),
   CONSTRAINT ck_telefono_numero_telefono_id
   CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
   CONSTRAINT fk_telefono_cliente
   FOREIGN KEY (cliente_id)
   REFERENCES cliente (cliente_id)
   ON DELETE CASCADE
   ON UPDATE CASCADE
   );
  GO
  
	SELECT
	* FROM cliente;
	SELECT*
	FROM telefono;

	--  Eliminar en ON DELETE CASCADE
	-- Eliminar al padre
	DELETE FROM cliente
	WHERE cliente_id=1;

	-- Actuallizar EN ON UPDATE CASCADE
	UPDATE cliente
	SET cliente_id=10
	WHERE cliente_id=1;

	

  DROP TABLE telefono;

  -- ON DELETE 
    CREATE TABLE telefono(
  telefono_id INT IDENTITY (1,1),
   numero_telefono VARCHAR(15)NOT NULL,
   created_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_created_at
   DEFAULT SYSDATETIME(),
   updated_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_updated_at
   DEFAULT SYSDATETIME(),
   cliente_id INT,
   CONSTRAINT pk_telefono
   PRIMARY KEY (telefono_id),
   CONSTRAINT uq_telefono_numero_telefono
   UNIQUE (numero_telefono),
   CONSTRAINT ck_telefono_numero_telefono_id
   CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
   CONSTRAINT fk_telefono_cliente
   FOREIGN KEY (cliente_id)
   REFERENCES cliente (cliente_id)
   ON DELETE SET NULL
   ON UPDATE SET NULL
   );
  GO



  INSERT INTO cliente ( cliente_id, empresa,telefono ,activo)
  values (11,'Bimbo','566788999', 1);

    INSERT INTO telefono(numero_telefono,cliente_id)
   VALUES ('11-345-2347', 11);


   INSERT INTO telefono(numero_telefono,cliente_id)
   VALUES ('111-345-3456', 11),
		  ('255-678-2345', 11),
		  ('123-768-2345',11),
		  ('773-143-2476', 3);
		  
		  DELETE FROM cliente
		  WHERE cliente_id=11;

		  UPDATE cliente
		  SET cliente_id= 15 
		  WHERE cliente_id=3;

		  SELECT * FROM cliente
		 SELECT * FROM telefono
		 -- ON DELETE Y ON UPDATE SET NULL
		 DROP TABLE telefono;

		  CREATE TABLE telefono(
  telefono_id INT IDENTITY (1,1),
   numero_telefono VARCHAR(15)NOT NULL,
   created_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_created_at
   DEFAULT SYSDATETIME(),
   updated_at DATETIME2 NOT NULL
   CONSTRAINT df_telefono_updated_at
   DEFAULT SYSDATETIME(),
   cliente_id INT 
   CONSTRAINT df_telefono_cliente_id
   DEFAULT 0,
   CONSTRAINT pk_telefono
   PRIMARY KEY (telefono_id),
   CONSTRAINT uq_telefono_numero_telefono
   UNIQUE (numero_telefono),
   CONSTRAINT ck_telefono_numero_telefono_id
   CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
   CONSTRAINT fk_telefono_cliente
   FOREIGN KEY (cliente_id)
   REFERENCES cliente (cliente_id)
   ON DELETE SET DEFAULT
   ON UPDATE SET DEFAULT
   );
  GO

  INSERT INTO cliente ( cliente_id, empresa,telefono ,activo)
  values (0,'Mostrador','66669147', 1);

   INSERT INTO cliente ( cliente_id, empresa,telefono ,activo)
  values (11,'Bimbo','566788999', 1);

    INSERT INTO telefono(numero_telefono,cliente_id)
   VALUES ('11-345-2347', 10);


   INSERT INTO telefono(numero_telefono,cliente_id)
   VALUES ('111-345-3456', 10),
		  ('255-678-2345', 10),
		  ('123-768-2345',10),
		  ('773-143-2476', 15);
		  
		  DELETE FROM cliente
		  WHERE cliente_id=10;


		  UPDATE cliente
		  SET cliente_id=17
		  WHERE cliente_id=15;

		  SELECT * FROM cliente
		 SELECT * FROM telefono
  CHECK (Telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')













































































































































































































































































































































































































































































































