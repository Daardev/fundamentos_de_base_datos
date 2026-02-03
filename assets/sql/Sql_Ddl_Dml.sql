-- P1. Crear Tablas del diagrama
-- P1. Tabla facturas con PK
DROP TABLE IF EXISTS facturas CASCADE;
CREATE TABLE facturas (
    id SERIAL PRIMARY KEY,  -- ID autoincremental + PK
    rut_comprador VARCHAR(12),
    rut_vendedor VARCHAR(12)
);

-- P1. Tabla productos con PK
DROP TABLE IF EXISTS productos CASCADE;
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,  -- ID autoincremental + PK
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);

-- P1. Tabla detalle_facturas con PK y FKs para consistencia referencial
DROP TABLE IF EXISTS detalle_facturas CASCADE;
CREATE TABLE detalle_facturas (
    id SERIAL PRIMARY KEY,     -- ID autoincremental + PK
    id_producto INTEGER,
    id_factura INTEGER,
    -- Definición de claves foráneas:
    FOREIGN KEY (id_producto) REFERENCES productos(id),
    FOREIGN KEY (id_factura) REFERENCES facturas(id)
    -- Nota: Si el detalle no guarda cantidades, asume 1 unidad
);

-- P1. Tabla existencias con PK y FK
DROP TABLE IF EXISTS existencias CASCADE;
CREATE TABLE existencias (
    id SERIAL PRIMARY KEY,                 -- ID autoincremental + PK
    id_producto INTEGER,
    cantidad INTEGER,
    precio INTEGER,
    pesoKg integer,
    
    FOREIGN KEY (id_producto) REFERENCES productos(id)  -- FK para consistencia
);



-- P2.Insertar 10 Productos
INSERT INTO productos (nombre, descripcion) VALUES
('Laptop Gamer Pro', 'Laptop de alto rendimiento para gaming con RTX 4070'),
('Mouse Inalámbrico Ergonómico', 'Mouse recargable con diseño ergonómico para oficina'),
('Teclado Mecánico RGB', 'Teclado mecánico con retroiluminación RGB personalizable'),
('Monitor 27" 4K', 'Monitor UHD de 27 pulgadas con HDR400'),
('Disco SSD 1TB NVMe', 'Unidad de estado sólido de alta velocidad para PC'),
('Auriculares Bluetooth Noise Cancelling', 'Audífonos con cancelación de ruido activa'),
('Webcam Full HD', 'Cámara web con micrófono integrado y enfoque automático'),
('Tablet 10" Android', 'Tablet con pantalla táctil y procesador octa-core'),
('Impresora Multifunción WiFi', 'Impresora, escáner y copiadora con conectividad inalámbrica'),
('Cargador Rápido 65W USB-C', 'Cargador compacto para laptop y dispositivos móviles');

-- P3. Insertar 10 existencias para productos
INSERT INTO existencias (id_producto, cantidad, precio, pesoKg) VALUES
(1, 15, 1299990, 2.30),   -- Laptop
(2, 50, 24990, 0.15),     -- Mouse
(3, 30, 89990, 0.85),     -- Teclado
(4, 20, 399990, 5.70),    -- Monitor
(5, 45, 79990, 0.08),     -- SSD
(6, 25, 149990, 0.32),    -- Auriculares
(7, 40, 45990, 0.25),     -- Webcam
(8, 18, 299990, 0.48),    -- Tablet
(9, 12, 189990, 8.20),    -- Impresora
(10, 60, 39990, 0.18);  

-- P4. facturas 5 regitros de facturas
-- Factura 1: Cliente compra varios productos
INSERT INTO facturas (rut_comprador, rut_vendedor) VALUES
('11.111.111-1', '99.888.777-6');

-- P4. Factura 2: Otra compra
INSERT INTO facturas (rut_comprador, rut_vendedor) VALUES
('22.222.222-2', '99.888.777-6');

-- P4. Factura 3: Compra de un tercer cliente
INSERT INTO facturas (rut_comprador, rut_vendedor) VALUES
('33.333.333-3', '77.666.555-4');

-- P4. Factura 4: Mismo cliente que factura 1, otro vendedor
INSERT INTO facturas (rut_comprador, rut_vendedor) VALUES
('11.111.111-1', '77.666.555-4');

-- P4. Factura 5: Cliente nuevo
INSERT INTO facturas (rut_comprador, rut_vendedor) VALUES
('44.444.444-4', '99.888.777-6');

-- P5. Detalle factura 1
INSERT INTO detalle_facturas (id_factura, id_producto) VALUES
(1, 1),  -- Laptop Gamer Pro
(1, 5),  -- Disco SSD 1TB NVMe
(1, 6),  -- Auriculares Bluetooth
(1, 10); -- Cargador Rápido
-- P5. Detalle para Factura 2 (3 productos)
INSERT INTO detalle_facturas (id_factura, id_producto) VALUES
(2, 2),  -- Mouse Inalámbrico
(2, 3),  -- Teclado Mecánico
(2, 7);  -- Webcam Full HD

-- P5. Detalle para Factura 3 (5 productos)
INSERT INTO detalle_facturas (id_factura, id_producto) VALUES
(3, 4),  -- Monitor 27" 4K
(3, 5),  -- Disco SSD
(3, 8),  -- Tablet Android
(3, 9),  -- Impresora Multifunción
(3, 10); -- Cargador Rápido

-- P5. Detalle para Factura 4 (4 productos)
INSERT INTO detalle_facturas (id_factura, id_producto) VALUES
(4, 1),  -- Laptop Gamer Pro
(4, 3),  -- Teclado Mecánico
(4, 6),  -- Auriculares Bluetooth
(4, 7);  -- Webcam Full HD

-- P5. Detalle para Factura 5 (3 productos)
INSERT INTO detalle_facturas (id_factura, id_producto) VALUES
(5, 2),  -- Mouse Inalámbrico
(5, 5),  -- Disco SSD
(5, 8);  -- Tablet Android

-- P6.Actualizar todas las existencias a cantidad 10
UPDATE existencias 
SET cantidad = 10;

-- P7.Agregar columna fecha a la tabla facturas
ALTER TABLE facturas 
ADD COLUMN fecha DATE DEFAULT CURRENT_DATE;

-- P8. Actualizar cada factura con una fecha diferente
UPDATE facturas SET fecha = '2025-10-01' WHERE id = 1;  -- Factura 1: 1 de marzo
UPDATE facturas SET fecha = '2026-01-05' WHERE id = 2;  -- Factura 2: 5 de marzo
UPDATE facturas SET fecha = '2026-02-10' WHERE id = 3;  -- Factura 3: 10 de marzo
UPDATE facturas SET fecha = '2026-02-12' WHERE id = 4;  -- Factura 4: 12 de marzo
UPDATE facturas SET fecha = '2026-02-15' WHERE id = 5;  -- Factura 5: 15 de marzo

-- P9. Eliminar la columna pesoKg de la tabla existencias (sugerencia ALTER TABLE)
ALTER TABLE existencias 
DROP COLUMN pesoKg;

-- P10. Obtener una factura específica con su detalle, nombres de productos y precios
SELECT 
    f.id AS factura_id,
    f.fecha,
    f.rut_comprador,
    f.rut_vendedor,
    p.nombre AS producto_nombre,
    p.descripcion AS producto_descripcion,
    e.precio AS precio_unitario,
    1 AS cantidad
FROM facturas f
JOIN detalle_facturas df ON f.id = df.id_factura  -- JOIN factura-detalle
JOIN productos p ON df.id_producto = p.id         -- JOIN detalle-producto
JOIN existencias e ON p.id = e.id_producto        -- JOIN producto-existencia (para precio)
WHERE f.id = 1  -- Podemos cambiar este número para consultar diferentes facturas
ORDER BY p.nombre;  -- Orden alfabético por producto (sugerencia ORDER BY)

-- P11. Valor final de una factura específica
SELECT 
    f.id AS factura_id,
    f.fecha,
    f.rut_comprador,
    f.rut_vendedor,
    COUNT(DISTINCT df.id_producto) AS cantidad_productos,
    SUM(e.precio) AS valor_total 
FROM facturas f
JOIN detalle_facturas df ON f.id = df.id_factura
JOIN existencias e ON df.id_producto = e.id_producto
WHERE f.id = 1  -- Cambia este número para consultar diferentes facturas
GROUP BY f.id, f.fecha, f.rut_comprador, f.rut_vendedor
ORDER BY f.fecha DESC;

/* --- P12.  Eliminar todos los productos, primero hay que eliminar las restricciones ---- */
DELETE FROM detalle_facturas;

-- P12. Luego eliminar existencias (dependen de productos)
DELETE FROM existencias;

-- P12. Finalmente eliminar productos
DELETE FROM productos;

select * from facturas;
select * from productos;
select * from detalle_facturas;
select * from existencias;