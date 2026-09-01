--------------------------------------
-- BodegaTech - Script de Inventario
-- Autor: Magalí Montes Kynast
-- Fecha: 21/07/2026
--------------------------------------

-- SECCIÓN DDL--------------------------------------------
DROP TABLE IF EXISTS inventario;

USE ClaseM3;

CREATE TABLE inventario(
	id_producto INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, -- Se utiliza INT puesto a que el ID es un número único e irrepetible que identifica a cada fila funcionando como la PRIMARY KEY, utilizando números enteros
	nombre_producto VARCHAR(100) NOT NULL, -- El nombre del producto es un tipo de dato de texto y, utilizamos como límite de caracteres 100
	categoria VARCHAR(50) NOT NULL, -- Al igual que el anterior, la descripción de la categorpia es un dato de tipo texto, en este caso, el límite es de 50 caracteres
	precio_unitario DECIMAL(10, 2) NOT NULL, -- Como se trata de un precio utilizamos DECIMAL, en este caso se permiten 10 dígitos y 2 decimales luego de la coma
	stock_actual INT NOT NULL, -- BodegaTech distribuye productos tecnológicos de manera que el stock, en este caso, siempre será un número entero
	stock_minimo INT NOT NULL, -- Al igual que el anterior, BodegaTech distribuye productos tecnológicos de manera que el stock, en este caso, siempre será un número entero
	fecha_ingreso DATE NOT NULL, -- Para la fecha de ingreso usamos el tipo de dato DATE para ver únicamente la fecha, sin especificar la hora
	activo TINYINT NOT NULL -- El tipo de dato TINYINT permite traer valores 0 y 1 indicando 1 para disponible y 0 para discontinuado
	);

-- SECCIÓN DML--------------------------------------------
INSERT INTO inventario(nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES
('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1), 
('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
('Teclado mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
('Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

UPDATE inventario SET stock_actual = 12 WHERE id_producto = 1
UPDATE inventario SET stock_actual = 68 WHERE id_producto = 2
UPDATE inventario SET stock_actual = 30 WHERE id_producto = 6
UPDATE inventario SET activo = 0 WHERE id_producto =8

SELECT * FROM inventario;
