# construccion de base de datos en sql server, mysql o mariadb, postgres

## SQL
- DDL (Data Definition lenguage)
- DML (Data Manipulation Lenguage)
DQL (Data Query Lenguaje )
DCL (Daata control lenjuage)
TCL (Trabsaction Control Language)

## DDL
Lenguaje de definicion de datos

se utiliza para  **crear y modificar la estroctura** de una base de datos

con DDL trabajamos sobre los objetos de la base de datos:

- base de datos 
- tablas
- vistas
- indices
- Restricciones
- Esquemas 
- procedimientos Almacenados
- funciones
- Disparadores

| Comando   | Funcion |
| :--- | :--- |
|Create  | crear objetos |
|Alter  | MOdificar objetos |
| Drop | Eliminar objetos |
| Truncate  | vacia una tabla |
| Rename | Renombrea objetos  (segun  el SGBD) |

### SQL- DML

**Lenguaje de manpulacion de datos**

sirve para **trabajar con la informacjon almacenads**
Nota: Aqui no cambia la estroctura , si no con los resgisgtros

**comandos principales**

| comando  | funcion |
| :--- | :--- |
| INSERT   | Inserta registros |
|UPDATE | Actualiza registros |
|DELETE| ELIMINA Registro |

## SQL- DQL

**Lenjuage de consulra de datos**


su funcion es **Consulrar Infromacion**

**Comandos principales**

 comando  | funcion |
| :--- | :--- |
| SELECT  | CONSULTAR INFORMACION |

Generalmente se combina com:
- WHERE
- ORDER BY
- GROUP BY
- HAVING 
- JOIN (LEFT, RIGHT, INNER, CROSS, FULL)
- TOP / LIMIT
- FUNCIONES DE AGREGADO
- FUNCIONES DE VENTANA 

## Nomenclatura de Construccion 
Utilizaremos la convencion  **snake_case**

| objeto| Comvencion | Ejemplo | 
| :--- | :--- | :--- | 
|  Base de datos | snake_case | control escolar | 
| Esquema | snake_case  |  ventas, rh, seguridad |
|   tabla | singular en snake_case | cliente, pedido, detalle_pedido |
|   columna | snake_case  | cliente_id, fecha_registro, correo _ electronico|
|   pk | <tabla>_id | cliente_id, producto_id |
|  fk | igual que la pk referenciada | cliente_id, categoria_id |
|  tabla puente | <tabla1>_<tabla2> | Alumno_curso, producto_provedor |

**Restricciones**

pk_cliente
fk_pedido_cliente
uq_cliente_correo_electronico
ck_producto_precio
df_cliente_activo


## DDL en SQL Server CREATE, ALTER Y DROP para la modificacion u creacion de tablas

**sintaxis de creacion de tablas**
```sql
CREATE TABLE nombre_tabla
(
    columna tipo_dato restricciones,
    columna tipo_dato restricciones

)
```

### Alter Table

permite modificar una tabla existente 

puede:

- Agregar columnas
- Eliminar columnas
- Modificar columnas
- Agregar restricciones 
- Eliminar restricciones