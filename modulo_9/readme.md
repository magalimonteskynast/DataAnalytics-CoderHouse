**RetailPro - Análisis de Ventas y Dashboard en Power BI**
**Descripción del Proyecto**
Este proyecto de analítica de datos está diseñado para RetailPro, una empresa de comercio minorista y mayorista de productos electrónicos en Argentina. El objetivo principal es 
consolidar, transformar y analizar la información transaccional para alimentar un dashboard en Power BI que optimice la toma de decisiones comerciales.
El análisis abarca el seguimiento de ventas por periodo, el rendimiento de productos por facturación y rotación, el comportamiento de compra de los clientes y la distribución territorial.

**Estratificación del Modelo de Datos**
El sistema utiliza una base de datos relacional orientada al modelo transaccional y posterior análisis multidimensional (Modelo en Estrella):
**ventas** (_Tabla de hechos_): Registro transaccional con id_venta, fecha_venta, cantidad, precio_unitario, canal y claves foráneas (id_cliente, id_producto, id_territorio).
**clientes** (_Dimensión_): Información del cliente (como nombre, apellido y correo electrónico), segmento (Minorista/Mayorista) y ciudad de residencia.
**productos** (_Dimensión_): Catálogo de artículos con nombre_producto, precio actual de lista, stock y activo.
**categorias** (_Dimensión_): Descripción de las categorías a las que corresponden los productos incluidos en la tabla anterior.
**territorios** (_Dimensión_): Ubicación geográfica del cliente (provincias y regiones de Argentina).

**Herramientas Utilizadas**
Engine SQL: SQL Server (Motor de base de datos relacional).
Power BI: Visualización de datos, modelado relacional y métricas DAX.
GitHub / Markdown: Documentación del proyecto.

**Guía de Ejecución de Scripts SQL**
**Prerrequisitos**
Tener instalado un cliente SQL (ej. SQL Server Management Studio, DBeaver).
Contar con permisos de creación y lectura de bases de datos.

**Pasos para Ejecutar**
**1. Creación e importación de la base de datos**
Ejecuta las sentencias de DDL para estructurar las tablas y, posteriormente, las sentencias DML para la inserción de datos (INSERT INTO) dentro de cada una de las tablas correspondientes 
en el orden sugerido:

SQL
-- 1. Crear dimensiones (DDL)
-- (Ejecutar scripts de clientes, productos, categorias y territorios)

-- 2. Crear tabla de hechos (DDL)
-- (Ejecutar script de ventas)

-- 3. Inserción de datos (DML)
-- (Ejecutar sentencias INSERT INTO para poblar cada una de las tablas)
2. Ejecución de la consulta consolidada (Desnormalización para Power BI)
Para extraer la vista plana de datos optimizada sin ordenar en el servidor (para mejor compresión en el motor VertiPaq de Power BI), ejecuta el script principal:

SQL
SELECT 
    v.fecha_venta,
    v.canal,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta,
    c.nombre AS nombre_cliente,
    c.segmento,
    t.region,
    p.nombre_producto,
    p.precio AS precio_lista_actual,
    cat.nombre_categoria
FROM ventas AS v
INNER JOIN clientes AS c 
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p 
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat 
    ON p.id_categoria = cat.id_categoria
INNER JOIN territorios AS t 
    ON v.id_territorio = t.id_territorio;

**3. Conexión con Power BI**
Abre Power BI Desktop.

Selecciona Obtener datos > SQL Server.
Ingresa las credenciales del servidor y pega la consulta anterior en la sección de Consulta SQL nativa, o bien importa las tablas por separado para armar la vista dimensional.
Al cargar las tablas de la base de datos, selecciona la opción **Transformar datos** para proceder con la limpieza y preparación correspondiente en Power Query. Una vez realizada, 
importa los datos limpios al modelo para el posterior armado de reportes.
