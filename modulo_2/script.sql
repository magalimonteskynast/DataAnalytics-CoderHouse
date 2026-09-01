CREATE DATABASE modulo2_unidad1_diseno;

USE modulo2_unidad1_diseno;

CREATE TABLE Clientes(
	id_cliente INT NOT NULL PRIMARY KEY, -- El ID de cliente es un número que representa a cada uno de ellos de manera excepcional, es decir es único e irrepetible para cada cliente
	nombre VARCHAR(100) NOT NULL, -- El nombre corresponde a un dato de tipo texto por lo que usamos VARCHAR, el cual también permite establecer un límite de caracteres
	perfil_bio TEXT NOT NULL, -- En esta columna, la idea es que el cliente deje una breve nota o biografía, de manera que usamos TEXT para no limitar la cantidad de caracteres al usuario
	fecha_registro DATE NOT NULL -- Como queremos únicamente la fecha, usamos DATE ya que TIMESTAMP nos trae, además de la fecha, la hora
	);

CREATE TABLE Productos(
	id_producto INT NOT NULL PRIMARY KEY, --El ID de producto es un número que representa a cada artículo de manera excepcional, siendo único e irrepetible para cada uno de ellos
	descripcion VARCHAR(255) NOT NULL, -- La descripción del artículo es un dato de tipo texto por lo que usamos VARCHAR ya que también nos permite limitar la cantidad de caracteres a ingresar en en esta columna
	precio DECIMAL(10, 2) NOT NULL, -- Como hablamos de precio, en general el estándar o tipo de dato que se utiliza para el mismo es DECIMAL, permitiendo la introducción de números de hasta 10 dígitos y dejando únicamente dos posiciones decimales luego de la coma
	esta_activo VARCHAR(2) NOT NULL -- En este caso elegí VARCHAR(2) para que se inserte datos de tipo si/no, sin poder ingresar más caracteres que esas dos letras
	);
