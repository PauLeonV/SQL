-- Creación de tablas
DROP DATABASE IF EXISTS restaurante_japones;
CREATE DATABASE IF NOT EXISTS restaurante_japones;

USE restaurante_japones;

CREATE TABLE IF NOT EXISTS restaurante_japones.clientes (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    tipo_documento VARCHAR(3) DEFAULT 'CC',
    documento VARCHAR(14) ,
    PRIMARY KEY (id),
    INDEX nombre (nombre , apellido)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.categoria_plato (
    id INT AUTO_INCREMENT,
    nombre_categoria VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.platos (
    id INT AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nombre_plato VARCHAR(40) NOT NULL,
    descripcion_plato VARCHAR(120),
    precio_plato DECIMAL(9 , 2 ),
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria)
        REFERENCES categoria_plato (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS restaurante_japones.roles_restaurante (
    id INT AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion_rol VARCHAR(200),
    sueldo DECIMAL(11,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.empleados (
    id INT AUTO_INCREMENT,
    id_rol INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    horario TIME,
    PRIMARY KEY (id),
    FOREIGN KEY (id_rol)
        REFERENCES roles_restaurante (id),
	INDEX nombre (nombre, apellido)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.orden (
    id INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    total_orden DECIMAL(9 , 2 ) NOT NULL,
    domicilio TINYINT DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id),
    FOREIGN KEY (id_empleado)
        REFERENCES empleados (id)
   );

CREATE TABLE IF NOT EXISTS restaurante_japones.facturas (
    id INT AUTO_INCREMENT,
    id_orden INT NOT NULL,
    id_plato INT NOT NULL,
    cantidad_plato INT NOT NULL,
    subtotal_venta DECIMAL(9 , 2 ),
    fecha_factura DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_orden)
        REFERENCES orden (id),
    FOREIGN KEY (id_plato)
        REFERENCES platos (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.paises_proveedores (
    id INT AUTO_INCREMENT,
    nombre_pais VARCHAR(25) NOT NULL DEFAULT 'Colombia',
    codigo_pais INT NOT NULL DEFAULT 57,
    moneda_pais VARCHAR(5) NOT NULL DEFAULT 'COP',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.proveedores (
    id INT AUTO_INCREMENT,
    id_pais INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    tipo_documento VARCHAR(3) DEFAULT 'CC',
    documento VARCHAR(14),
    PRIMARY KEY (id),
    FOREIGN KEY (id_pais)
        REFERENCES paises_proveedores (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.productos (
    id INT AUTO_INCREMENT,
    id_plato INT NOT NULL,
    id_proveedor INT NOT NULL,
    nombre_producto VARCHAR(40) NOT NULL,
    peso DECIMAL(5 , 2 ),
    precio_producto DECIMAL(9 , 2 ) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_plato)
        REFERENCES platos (id),
    FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.ingredientes (
    id_producto INT NOT NULL,
    id_plato INT NOT NULL,
    cantidad_ingrediente DECIMAL(5 , 2 ) NOT NULL,
    FOREIGN KEY (id_producto)
        REFERENCES productos (id),
    FOREIGN KEY (id_plato)
        REFERENCES platos (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.stock (
    id_producto INT NOT NULL,
    id_proveedor INT NOT NULL,
    cantidad_stock INT NOT NULL,
    cantidad_minima INT,
    cantidad_ideal INT,
    FOREIGN KEY (id_producto)
        REFERENCES productos (id),
    FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.pedidos (
    id INT AUTO_INCREMENT,
    id_producto INT NOT NULL,
    id_proveedor INT NOT NULL,
    cantidad_producto INT NOT NULL,
    total_pedido DECIMAL(11 , 2 ) NOT NULL,
    fecha_pedido DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (id_producto)
        REFERENCES productos (id),
    FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id)
);

CREATE TABLE IF NOT EXISTS restaurante_japones.telefonos (
    id INT AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    id_proveedor INT,
    telefono INT NOT NULL,
    telefono_principal TINYINT DEFAULT 1,
    PRIMARY KEY (id),
    CONSTRAINT fk_telefono_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_telefono_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleados (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_telefono_proveedor FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS restaurante_japones.emails (
    id INT AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    id_proveedor INT,
    email VARCHAR(120) NOT NULL,
    email_principal TINYINT DEFAULT 1,
    PRIMARY KEY (id),
    CONSTRAINT fk_email_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_email_vendedor FOREIGN KEY (id_empleado)
        REFERENCES empleados (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_email_proveedor FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uni_email UNIQUE (email)
);


CREATE TABLE IF NOT EXISTS restaurante_japones.direcciones (
    id INT AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    id_proveedor INT,
    id_pais INT,
    direccion VARCHAR(200) NOT NULL,
    ciudad VARCHAR(40) NOT NULL,
    provincia VARCHAR(40) NOT NULL,
    cod_postal VARCHAR(10) NOT NULL,
    direccion_principal TINYINT DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (id_pais)
        REFERENCES paises_proveedores (id),
    CONSTRAINT fk_direccion_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_direccion_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleados (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_direccion_proveedor FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREACION DE VISTAS 

USE restaurante_japones;

CREATE OR REPLACE VIEW info_completa_clientes AS 
SELECT 
	c.nombre AS 'Nombre',
    c.apellido AS 'Apellido',
    e.email AS 'Email cliente',
    t.telefono AS 'Telefono cliente'
FROM clientes AS c
LEFT JOIN emails AS e ON e.id_cliente = c.id
LEFT JOIN telefonos AS t ON t.id_cliente = c.id
WHERE e.id_cliente IS NOT NULL AND t.id_cliente IS NOT NULL;

CREATE OR REPLACE VIEW platos_mas_vendidos  AS
SELECT
	p.nombre_plato AS 'Nombre Plato'
    , COUNT(*) AS 'Cantidad'
FROM facturas AS f
JOIN platos AS p ON p.id = f.id_plato
GROUP BY p.nombre_plato 
ORDER BY COUNT(*) DESC;

CREATE OR REPLACE VIEW ingresos_por_categoria  AS
SELECT
	cp.nombre_categoria AS 'Categoria',
    SUM(f.subtotal_venta) AS 'Ingresos'
FROM categoria_plato AS cp
LEFT JOIN platos AS p ON p.id_categoria = cp.id
LEFT JOIN facturas AS f ON p.id = f.id_plato
GROUP BY cp.id, cp.nombre_categoria
ORDER BY SUM(f.subtotal_venta) DESC;

-- CREACION DE FUNCIONES 
-- Función para caulcular el iva
USE restaurante_japones;
DROP FUNCTION IF EXISTS calcular_iva;

DELIMITER $$

CREATE FUNCTION calcular_iva (subtotal DECIMAL (9,2)) 
RETURNS DECIMAL (9,2)
DETERMINISTIC
BEGIN
	DECLARE resultado_iva DECIMAL (9,2);
    DECLARE iva DECIMAL (3,2);
    SET iva = 0.19;
    SET resultado_iva = subtotal * iva;
    RETURN resultado_iva;
END$$

-- Función para calcular el total de las facturas que comparten el mismo id de orden
USE restaurante_japones$$
DROP FUNCTION IF EXISTS calcular_subtotal_factura$$

CREATE FUNCTION calcular_subtotal_factura (orden_numero INT)
RETURNS DECIMAL (9,2)
READS SQL DATA
BEGIN
		DECLARE subtotal DECIMAL (9,2);
        SELECT 
			SUM(subtotal_venta) INTO subtotal
		FROM 
			facturas
		WHERE 
			id_orden = orden_numero;

RETURN subtotal;
END$$
-- Función para calcular el total de una orden
USE restaurante_japones$$
DROP FUNCTION IF EXISTS calcular_total_orden$$


CREATE FUNCTION calcular_total_orden (id_de_orden INT)
RETURNS DECIMAL (9,2)
DETERMINISTIC
BEGIN
	DECLARE subtotal DECIMAL (9,2);
    DECLARE resultado_iva DECIMAL (9,2);
    DECLARE resultado_total_orden DECIMAL (9,2);
    SET subtotal = calcular_subtotal_factura(id_de_orden);
	SET resultado_iva = calcular_iva(subtotal);
    SET resultado_total_orden = subtotal + resultado_iva;
    RETURN  resultado_total_orden;
END$$

DELIMITER ;





