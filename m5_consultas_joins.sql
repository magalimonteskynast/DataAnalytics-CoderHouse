-- Consulta 1 - INNER JOIN
SELECT 
	ventas.fecha_venta,
	clientes.nombre AS nombre_cliente,
	clientes.segmento,
	territorios.region,
	productos.nombre_producto,
	categorias.nombre_categoria,
	ventas.cantidad,
	productos.precio,
	(ventas.cantidad * ventas.precio_unitario) AS total_venta,
	ventas.canal
FROM ventas 
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos ON ventas.id_producto = productos.id_producto
INNER JOIN territorios ON ventas.id_territorio = territorios.id_territorio
INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria
ORDER BY fecha_venta ASC;

-- Consulta 2 - LEFT JOIN
SELECT 
	clientes.nombre,
	clientes.email,
	clientes.fecha_registro,
	ventas.cantidad
FROM clientes
LEFT JOIN ventas ON clientes.id_cliente = ventas.id_cliente
WHERE ventas.cantidad IS NULL;

-- Consulta 3 - LEFT JOIN
SELECT 
	productos.nombre_producto,
	categorias.nombre_categoria,
	productos.precio,
	ventas.cantidad
FROM productos
LEFT JOIN ventas ON productos.id_producto = ventas.id_producto
INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria
WHERE ventas.cantidad IS NULL;

-- Consulta 4 - UNION ALL
SELECT
    canal,
    SUM(monto_total) AS total_por_canal
FROM (
    SELECT monto_total,'Online' AS canal FROM ventas_online
    UNION ALL
    SELECT monto_total, 'Presencial' AS canal FROM ventas_presenciales
) AS ventas_consolidadas
GROUP BY canal;
