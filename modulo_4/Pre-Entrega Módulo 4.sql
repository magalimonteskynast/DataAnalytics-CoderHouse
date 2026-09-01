-- CONSULTA 1: Resumen ejecutivo mensual
SELECT 
	MONTH(fecha_venta) AS mes,
	SUM(cantidad * precio_unitario) AS total_facturado,
	COUNT(*) AS cantidad_pedidos,
	AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- CONSULTA 2: Ranking de productos
SELECT TOP 5
	id_producto,
	SUM(cantidad) AS cantidad_vendida,
	SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY SUM(cantidad * precio_unitario) DESC;

-- CONSULTA 3: Clientes recurrentes
SELECT 
	id_cliente,
	COUNT(*) AS cantidad_pedidos,
	SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- CONSULTA 4: Meses por encima/ por debajo del promedio
SELECT 
	MONTH(fecha_venta) AS mes,
	SUM(cantidad * precio_unitario) AS total_facturado,
	CASE
		WHEN SUM(cantidad * precio_unitario)  > AVG(cantidad * precio_unitario) THEN 'Por encima'
		WHEN SUM(cantidad * precio_unitario)  < AVG(cantidad * precio_unitario) THEN 'Por debajo'
	ELSE 'En el promedio'
	END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- HALLAZGOS
-- 1) El Producto 1 (id_producto = 1) concentra el 55,87% de la facturación de marzo (total = $6.444 y id_producto 1 = $3.600)
-- 2) Todos los clientes realizaron más de 1 pedido, aunque los clientes de ID 1 y 5 son los que más gasto realizaron en sus compras (ID 1 = $1.640 y ID 2= $2.100), superando ampliamente al resto de los clientes.
-- 3) El total facturado en marzo fue de $6.444, esto se encuentra por encima del promedio y, en línea con lo mencionado en el hallazgo #2, el 73,56% de dicha facturación proviene de los clientes 1 y 5.
