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
        REFERENCES orden (id)
        ON DELETE CASCADE,
    FOREIGN KEY (id_plato)
        REFERENCES platos (id)
        ON DELETE CASCADE
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

-- INSERCION DE DATOS 

INSERT INTO restaurante_japones.clientes(id, nombre, apellido, tipo_documento, documento) VALUES
 (1, 'Britni', 'Hollidge', 'CC', 12363236),
 (2, 'Frederick', 'Varne', 'TI', 29473260),
 (3, 'Lucius', 'Bernuzzi', 'CC', 37320641),
 (4, 'Tracie', 'Cettell', 'DNI', 43352500),
 (5, 'Christiano', 'Freer', 'DNI', 48588106),
 (6, 'Wilmette', 'Penylton', 'TI', 24563964),
 (7, 'Gerome', 'Feye', 'CC', 33552952),
 (8, 'Sigrid', 'Couth', 'TI', 12780506),
 (9, 'Cristine', 'Brannon', 'CI', 19000076),
 (10, 'Baily', 'Timny', 'CI', 11675544),
 (11, 'Calli', 'Muckley', 'DNI', 33615308),
 (12, 'Jeth', 'Gillion', 'CI', 10598309),
 (13, 'Coleman', 'Fruser', 'CC', 38298528),
 (14, 'Kingsly', 'Simon', 'CC', 32759213),
 (15, 'Alidia', 'Fernant', 'CC', 46012914),
 (16, 'Bronnie', 'Salandino', 'CI', 37794109),
 (17, 'Kelsy', 'Poile', 'CI', 10797385),
 (18, 'Tommy', 'Lawrence', 'CI', 16207656),
 (19, 'Robinetta', 'Wynes', 'CI', 35315023),
 (20, 'Mollee', 'Cotelard', 'DNI', 26937341);
 
 INSERT INTO restaurante_japones.categoria_plato(id, nombre_categoria) VALUES
 (1, 'Entrada'),
 (2, 'Sopas/Ramen'),
 (3, 'Plato fuerte'),
 (4, 'Postre'),
 (5, 'Bebida'),
 (6, 'Plato infantil'),
 (7, 'Adicional');
 
 INSERT INTO restaurante_japones.platos (id, id_categoria, nombre_plato,descripcion_plato, precio_plato) VALUES 
 (1,1,'Gyozas de cerdo','6 Gyozas rellenas de cerdo con soja',11000 ),
 (2,1,'Gyozas vegetarianas','6 gyozas rellenas de repollo,zuchini y champiñon', 9000),
 (3,1,'Crab Salad','Palmito de cangrejo premium, spicy mayo, tobiko y aguacate', 17500),
 (4,1,'Nigiri Salmón','Arroz de sushi y 3 unidades de salmón',15500),
 (5,1,'Sashimi Salmón','Salmón crudo',15500),
 (6,2,'Shoyu Ramen','Ramen con caldo a base de soya y cerdo acompañado con noodels artesanales', 22000),
 (7,2, 'Miso Ramen', 'Ramen con caldo de miso y cerdo, huevo marinado, cebolla, repollo, cerdo con especies japones', 22000),
 (8,2,'Ramen de langosta','Ramen con caldo a base de pescado y ondashi,langosta adobada con especies y mantequilla artesanal', 85000),
 (9,2,'Sopa Miso', 'Sopa con miso con verduras cocidas y noodles artesanales', 15000),
 (10,3,'Wok al curry','Wok con cerdo, pimentón, ceboola y zucchini, salteado al curry con arroz o noodles', 22000),
 (11,3, 'Spicy Wok','Wok con carne y pollo, raices, cebolla,s iracha, zucchini,maiz y picantes', 27000),
 (12,4,'Moshi','Dulce tradicional japones relleno de helado',14000),
 (13,4,'Banana tempura','Banano en trozos con tempura acompañado de leche condensada', 11000),
 (14,5,'Agua','',5000),
 (15,5,'Gaseosas marca Postobon','',6000),
 (16,5,'Coca Cola','',6000),
 (17,5,'Limonada Natural','',6000),
 (18,6,'Chicken Finger','Pollo frito en forma de dedos', 19500),
 (19,6,'Sushi Burger','',15500),
 (20,6,'Ramen Pequeño','', 165000),
 (21,7,'Noodles','',6500),
 (22,7,'Proteina','',9000),
 (23,7,'Alga Nori','',1500),
 (24,7,'Tempura','',3500);
 
 INSERT INTO restaurante_japones.roles_restaurante(nombre_rol,descripcion_rol, sueldo) VALUES
 ('Gerente del restaurante','Responsable de supervisar todas las operaciones,garantizar el cumplimiento de normas y regulaciones, gestionar el personal y administrar el presupuesto', 2500000),
 ('Chef ejecutivo','Encargado de crear el menú, supervisar la preparación de los platos y mantener altos estándares de calidad en la cocina', 2200000),
 ('Cocinero','Preparan los alimentos según las recetas y las indicaciones del chef ejecutivo. Pueden haber diferentes cocineros especializados, como cocineros de línea, pasteleros, etc', 1800000),
 ('Personal de servicio','Incluye camareros, camareras y meseros que atienden a los clientes en el comedor, toman pedidos y sirven los alimentos y bebidas', 1500000),
 ('Anfitrión','Reciben a los clientes en la entrada del restaurante, los conducen a sus mesas y gestionan las reservaciones', 1700000),
 ('Gerente de eventos','Si el restaurante organiza eventos especiales, este rol se encarga de su planificación y ejecución', 1500000),
 ('Personal de marketing y relaciones públicas','Responsables de promocionar el restaurante, gestionar las redes sociales y mantener una buena imagen pública',1200000),
 ('Gerente de finanzas o contabilidad','Encargado de llevar la contabilidad, el presupuesto y las finanzas del restaurante', 2200000);
 
 INSERT INTO restaurante_japones.empleados (id_rol,nombre,apellido,horario) VALUES
 (2, 'Kellsie', 'Marushak', '9:17:56'),
 (1, 'Otha', 'Pady', '12:30:03'),
 (4, 'Rollo', 'Stockey', '11:43:05'),
 (4, 'Linus', 'Letterese', '12:32:10'),
 (2, 'Yolanda', 'McLay', '12:55:38'),
 (7, 'Kimbra', 'Shipcott', '12:10:16'),
 (4, 'Mavra', 'Domelaw', '10:22:11'),
 (5, 'Rickert', 'Leyfield', '11:15:19'),
 (7, 'Casandra', 'Hambleton', '11:44:55'),
 (8, 'Deidre', 'Schnieder', '12:29:10'),
 (7, 'Chery', 'Cowan', '11:58:46'),
 (8, 'Fionna', 'Whate', '9:27:19'),
 (5, 'Crissy', 'Leabeater', '12:05:25'),
 (4, 'Nobe', 'Kilvington', '9:20:27'),
 (6, 'Kariotta', 'Asling', '10:55:34'),
 (3, 'Lyndy', 'Sessions', '11:05:38'),
 (4, 'Bobbie', 'Wathan', '10:16:58'),
 (8, 'Laraine', 'Seefeldt', '11:45:09'),
 (8, 'Joann', 'Costen', '12:00:22'),
 (4, 'Cicily', 'MacCahee', '12:30:46');
 
INSERT INTO restaurante_japones.orden (id_cliente,id_empleado,total_orden,domicilio) VALUES
(7, 3, '471500', 0),
(4, 17, '182000', 1),
(4, 17, '72500', 0),
(16, 7, '75000', 1),
(15, 3, '70500', 1),
(17, 7, '288000', 1),
(4, 7, '154500', 1),
(5, 7, '222000', 1),
(17, 4, '31000', 0),
(7, 14, '283500', 1),
(20, 20, '39000', 1),
(7, 4, '31500', 0),
(17, 20, '387000', 1),
(4, 3, '95500', 1),
(1, 7, '320500', 0),
(18, 17, '41000', 1),
(19, 7, '14500', 1),
(12, 4, '31500', 1),
(16, 14, '389000', 0),
(1, 4, '424000', 1);

 
INSERT INTO restaurante_japones.facturas (id_orden, id_plato, cantidad_plato, subtotal_venta, fecha_factura) VALUES
(1, 11, 4, 108000, '2022-04-10'),
(1, 17, 4, 24000, '2022-04-10'),
(1, 3, 8, 140000, '2022-04-10'),
(1,20,5,82500,'2022-04-10'),
(1,8,1,85000,'2022-04-10'),
(1,16,4,24000,'2022-04-10'),
(1,20,5,82500,'2022-04-10'),
(1,22,1,8000,'2022-04-10'),
(2,20,5,82500,'2022-04-10'),
(2,12,3,42000,'2022-04-10'),
(2,19,3,57500,'2022-04-10'),
(3,21,1,6500,'2022-04-11'),
(3,10,3,66000,'2022-04-11'),
(4,5,4,62000,'2022-04-11'),
(4,15,1,6000,'2022-04-11'),
(4,24,2,7000,'2022-04-11'),
(5, 6, 2, 44000, '2022-04-11'),
(5, 10, 1, 22000, '2022-04-11'),
(6, 8, 1, 85000, '2022-04-12'),
(6, 9, 2, 30000, '2022-04-12'),
(7, 12, 4, 56000, '2022-04-12'),
(7, 13, 2, 22000, '2022-04-12'),
(8, 6, 1, 22000, '2022-04-12'),
(8, 9, 1, 15000, '2022-04-12'),
(8, 14, 1, 5000, '2022-04-12'),
(9, 6, 1, 22000, '2022-04-12'),
(9, 9, 2, 30000, '2022-04-12'),
(10, 1, 1, 11000, '2022-04-12'),
(10, 10, 1, 22000, '2022-04-12'),
(11, 8, 2, 170000, '2022-04-13'),
(11, 9, 2, 30000, '2022-04-13'),
(12, 10, 1, 22000, '2022-04-13'),
(13, 16, 1, 6000, '2022-04-13'),
(14, 1, 1, 11000, '2022-04-13'),
(14, 10, 1, 22000, '2022-04-13'),
(14, 15, 1, 6000, '2022-04-13'),
(15, 18, 1, 19500, '2022-04-14'),  
(16, 17, 1, 6000, '2022-04-14'),
(17, 1, 1, 11000, '2022-04-14'),
(17, 10, 1, 22000, '2022-04-14'),
(18, 18, 1, 19500, '2022-04-14'),
(19, 19, 1, 15500, '2022-04-14'),
(20, 6, 1, 22000, '2022-04-14'),
(20, 7, 1, 22000, '2022-04-14');

INSERT INTO restaurante_japones.paises_proveedores (nombre_pais, codigo_pais, moneda_pais) VALUES
('Colombia',57,'COP'),
('Japon',81,'JPY'),
('China',86,'CNY'),
('Taiwan',886, 'TWD');

INSERT INTO restaurante_japones.proveedores (id_pais,nombre, apellido, tipo_documento, documento)  VALUES
(1, 'Jú', 'Coppeard', 'CC', '0922239878'),
(4, 'Eliès', 'Parham', 'DNI', '6624543213'),
(1, 'Åslög', 'Feldharker', 'CI', '5382758336'),
(1, 'Marie-josée', 'Dawdry', 'CC', '8155939073'),
(1, 'Mårten', 'Eliaz', 'CI', '2546979175'),
(2, 'Lài', 'Olphert', 'CI', '4869678888'),
(3, 'Cloé', 'Moulton', 'DNI', '5372802855'),
(3, 'Rachèle', 'Miche', 'DNI', '9439378026'),
(3, 'Andrée', 'Prazor', 'DNI', '5170048971'),
(1, 'Ruì', 'Grason', 'CC', '2293843912');


INSERT INTO restaurante_japones.productos (id_plato,id_proveedor,nombre_producto,peso,precio_producto) VALUES
(1, 1, 'Empaque de Gyozas de cerdo', 0.2, 1500),
(2, 1, 'Empaque de Gyozas vegetarianas', 0.18, 1300),
(3, 2, 'Empaque de Crab Salad', 0.25, 1800),
(4, 3, 'Nigiri Salmón fresco', 0.05, 6000),
(5, 3, 'Sashimi Salmón fresco', 0.1, 9000),
(6, 4, 'Empaque de Shoyu Ramen', 0.3, 2500),
(7, 4, 'Empaque de Miso Ramen', 0.3, 2700),
(8, 4, 'Langosta adobada con especies', 0.15, 20000),
(9, 4, 'Sopa Miso instantánea', 0.1, 800),
(10, 5, 'Salsa de curry', 0.5, 1200),
(11, 5, 'Salsa Spicy Wok', 0.6, 1500),
(12, 5, 'Arroz para Moshi', 0.25, 800),
(13, 5, 'Harina para tempura', 0.35, 1000),
(14, 6, 'Botella de agua', 0.5, 1500),
(15, 6, 'Botella de gaseosa Postobon', 0.6, 1800),
(16, 6, 'Botella de Coca Cola', 0.6, 1800),
(17, 6, 'Jugoso Limonada Natural', 0.6, 2000),
(18, 7, 'Empaque de Chicken Finger', 0.25, 3500),
(19, 7, 'Empaque de Sushi Burger', 0.3, 3000),
(20, 7, 'Empaque de Ramen Pequeño', 0.2, 2800),
(21, 8, 'Noodles artesanales', 0.3, 5000),
(22, 8, 'Pollo fresco', 0.5, 6000),
(23, 8, 'Alga Nori para sushi', 0.05, 3000),
(24, 9, 'Vegetales frescos para tempura', 0.3, 4000);

INSERT INTO restaurante_japones.ingredientes (id_producto,id_plato, cantidad_ingrediente) VALUES 
(1, 1, 0.05), -- Empaque de Gyozas de cerdo necesita 0.05 kg de cerdo
(1, 6, 0.2),  -- Empaque de Gyozas de cerdo necesita 0.2 kg de repollo
(1, 22, 0.01), -- Empaque de Gyozas de cerdo necesita 0.01 kg de cebolla
(2, 2, 0.04),  -- Empaque de Gyozas vegetarianas necesita 0.04 kg de repollo
(2, 23, 0.02), -- Empaque de Gyozas vegetarianas necesita 0.02 kg de champiñones
(3, 3, 0.12),  -- Empaque de Crab Salad necesita 0.12 kg de palmito de cangrejo
(3, 5, 0.03),  -- Empaque de Crab Salad necesita 0.03 kg de aguacate
(4, 4, 0.01),  -- Nigiri Salmón fresco necesita 0.01 kg de salmón
(5, 5, 0.1),   -- Sashimi Salmón fresco necesita 0.1 kg de salmón
(6, 6, 0.1),   -- Empaque de Shoyu Ramen necesita 0.1 kg de noodles artesanales
(6, 24, 0.01), -- Empaque de Shoyu Ramen necesita 0.01 kg de tempura
(7, 7, 0.1),   -- Empaque de Miso Ramen necesita 0.1 kg de noodles artesanales
(8, 8, 0.1),   -- Langosta adobada con especies necesita 0.1 kg de langosta
(9, 9, 0.1),   -- Sopa Miso instantánea necesita 0.1 kg de verduras cocidas
(10, 10, 0.15), -- Salsa de curry necesita 0.15 kg de cerdo
(10, 21, 0.1),  -- Salsa de curry necesita 0.1 kg de noodles
(11, 10, 0.2),  -- Salsa Spicy Wok necesita 0.2 kg de cerdo
(11, 22, 0.1),  -- Salsa Spicy Wok necesita 0.1 kg de cebolla
(12, 12, 0.05), -- Arroz para Moshi necesita 0.05 kg de helado
(13, 13, 0.1),  -- Harina para tempura necesita 0.1 kg de banano
(13, 14, 0.02), -- Harina para tempura necesita 0.02 kg de leche condensada
(14, 14, 0.5),  -- Botella de agua necesita 0.5 kg de agua
(15, 15, 0.6),  -- Botella de gaseosa Postobon necesita 0.6 kg de gaseosa
(16, 16, 0.6),  -- Botella de Coca Cola necesita 0.6 kg de Coca Cola
(17, 17, 0.6),  -- Jugoso Limonada Natural necesita 0.6 kg de limonada natural
(18, 18, 0.2),  -- Empaque de Chicken Finger necesita 0.2 kg de pollo
(19, 19, 0.1),  -- Empaque de Sushi Burger necesita 0.1 kg de carne
(20, 20, 0.2),  -- Empaque de Ramen Pequeño necesita 0.2 kg de noodles
(21, 21, 0.3),  -- Noodles artesanales necesita 0.3 kg de noodles
(21, 9, 0.1),   -- Noodles artesanales necesita 0.1 kg de verduras cocidas
(22, 9, 0.2),   -- Pollo fresco necesita 0.2 kg de verduras cocidas
(22, 18, 0.05), -- Pollo fresco necesita 0.05 kg de pollo
(23, 23, 0.2),  -- Alga Nori para sushi necesita 0.2 kg de alga nori
(24, 14, 0.05); -- Vegetales frescos para tempura necesita 0.05 kg de leche condensada

INSERT INTO restaurante_japones.stock (id_producto, id_proveedor, cantidad_stock, cantidad_minima, cantidad_ideal) VALUES
(1, 2, 20, 15, 180),
(2, 1, 10, 30, 250),
(3, 2, 10, 30, 160), 
(4, 3, 15, 10, 100),
(5, 3, 12, 12, 110), 
(6, 5, 20, 45, 350), 
(7, 4, 18, 40, 350),
(8, 6, 10, 10, 100),
(9, 6, 15, 12, 110),
(10, 7, 20, 50, 400),
(11, 7, 25, 45, 350),
(12, 8, 18, 40, 350),
(13, 8, 5, 10, 100),
(14, 9, 6, 12, 110),
(15, 9, 20, 50, 400),
(16, 10, 18, 45, 350),
(17, 10, 18, 40, 350),
(18, 1, 5, 10, 100),
(19, 1, 6, 12, 110),
(20, 2, 20, 50, 400),
(21, 2, 18, 45, 350),
(22, 3, 18, 40, 350),
(23, 3, 5, 10, 100),
(24, 4, 6, 12, 110);

INSERT INTO restaurante_japones.pedidos (id_producto, id_proveedor, cantidad_producto, total_pedido, fecha_pedido) VALUES
(1, 1, 10, 30000, '2022-03-15'),
(2, 1, 8, 24000, '2022-03-16'),
(3, 2, 5, 9000, '2022-03-17'),
(4, 3, 3, 18000, '2022-03-18'),
(5, 3, 6, 54000, '2022-03-19'),
(6, 4, 12, 30000, '2022-03-20'),
(7, 4, 7, 18900, '2022-03-21'),
(8, 5, 4, 80000, '2022-03-22'),
(9, 5, 9, 7200, '2022-03-23'),
(10, 6, 15, 42000, '2022-03-24'),
(11, 7, 18, 54000, '2022-03-25'),
(12, 8, 7, 21000, '2022-03-26'),
(13, 8, 5, 10000, '2022-03-27'),
(14, 9, 20, 30000, '2022-03-28'),
(15, 9, 15, 45000, '2022-03-29'),
(16, 10, 8, 24000, '2022-03-30'),
(17, 10, 3, 12000, '2022-03-31'),
(18, 1, 6, 18000, '2022-03-01'),
(19, 1, 10, 35000, '2022-03-02'),
(20, 2, 12, 36000, '2022-03-03'),
(21, 2, 9, 27000, '2022-03-04'),
(22, 3, 15, 45000, '2022-03-05'),
(23, 3, 4, 16000, '2022-03-06'),
(24, 4, 10, 30000, '2022-03-07');

INSERT INTO restaurante_japones.telefonos (id_cliente, id_empleado, id_proveedor, telefono, telefono_principal) VALUES
    -- Clientes
    (1, NULL, NULL, 123456789, 1),   
    (1, NULL, NULL, 987654321, 0),   
    (2, NULL, NULL, 555555555, 1),   
    (2, NULL, NULL, 777777777, 0),   
    (3, NULL, NULL, 111111111, 1),   
    (3, NULL, NULL, 999999999, 0),   

    -- Empleados
    (NULL, 1, NULL, 444444444, 1),   
    (NULL, 1, NULL, 666666666, 0),   
    (NULL, 2, NULL, 222222222, 1),   
    (NULL, 2, NULL, 888888888, 0),   
    -- Proveedores
    (NULL, NULL, 1, 777777777, 1),   
    (NULL, NULL, 1, 999999999, 0),   
    (NULL, NULL, 2, 111111111, 1),   
    (NULL, NULL, 2, 333333333, 0),   
    (NULL, NULL, 3, 555555555, 1),   
    (NULL, NULL, 3, 888888888, 0);   

INSERT INTO restaurante_japones.emails (id_cliente, id_empleado, id_proveedor, email, email_principal) VALUES
    -- Clientes
    (1, NULL, NULL, 'cliente1@example.com', 1),    
    (1, NULL, NULL, 'cliente1_secundario@example.com', 0),  
    (2, NULL, NULL, 'cliente2@example.com', 1),     
    (2, NULL, NULL, 'cliente2_secundario@example.com', 0),  
    (3, NULL, NULL, 'cliente3@example.com', 1),    
    (3, NULL, NULL, 'cliente3_secundario@example.com', 0),  

    -- Empleados
    (NULL, 1, NULL, 'empleado1@example.com', 1),    
    (NULL, 1, NULL, 'empleado1_secundario@example.com', 0), 
    (NULL, 2, NULL, 'empleado2@example.com', 1),    
    (NULL, 2, NULL, 'empleado2_secundario@example.com', 0), 

    -- Proveedores
    (NULL, NULL, 1, 'proveedor1@example.com', 1),   
    (NULL, NULL, 1, 'proveedor1_secundario@example.com', 0),  
    (NULL, NULL, 2, 'proveedor2@example.com', 1),   
    (NULL, NULL, 2, 'proveedor2_secundario@example.com', 0),  
    (NULL, NULL, 3, 'proveedor3@example.com', 1),  
    (NULL, NULL, 3, 'proveedor3_secundario@example.com', 0);  
    
INSERT INTO restaurante_japones.direcciones (id_cliente, id_empleado, id_proveedor, id_pais, direccion, ciudad, provincia, cod_postal, direccion_principal) VALUES
    -- Clientes
    (1, NULL, NULL, NULL, 'Calle 123, #456', 'Ciudad Cliente 1', 'Provincia Cliente 1', '12345', 1),  
    (1, NULL, NULL, NULL, 'Avenida 987, #654', 'Ciudad Cliente 1', 'Provincia Cliente 1', '54321', 0),
    (2, NULL, NULL, NULL, 'Calle 456, #789', 'Ciudad Cliente 2', 'Provincia Cliente 2', '67890', 1),  
    (2, NULL, NULL, NULL, 'Avenida 321, #987', 'Ciudad Cliente 2', 'Provincia Cliente 2', '09876', 0), 
    (3, NULL, NULL, NULL, 'Carrera 111, #222', 'Ciudad Cliente 3', 'Provincia Cliente 3', '11111', 1), 
    (3, NULL, NULL, NULL, 'Calle 999, #888', 'Ciudad Cliente 3', 'Provincia Cliente 3', '88888', 0), 

    -- Empleados
    (NULL, 1, NULL, NULL, 'Avenida Empleado 1, #111', 'Ciudad Empleado 1', 'Provincia Empleado 1', '11111', 1),  
    (NULL, 1, NULL, NULL, 'Carrera Empleado 1, #222', 'Ciudad Empleado 1', 'Provincia Empleado 1', '22222', 0), 
    (NULL, 2, NULL, NULL, 'Calle Empleado 2, #333', 'Ciudad Empleado 2', 'Provincia Empleado 2', '33333', 1),  
    (NULL, 2, NULL, NULL, 'Avenida Empleado 2, #444', 'Ciudad Empleado 2', 'Provincia Empleado 2', '44444', 0), 

    -- Proveedores
    (NULL, NULL, 1, NULL, 'Carrera Proveedor 1, #555', 'Ciudad Proveedor 1', 'Provincia Proveedor 1', '55555', 1),  
    (NULL, NULL, 1, NULL, 'Calle Proveedor 1, #666', 'Ciudad Proveedor 1', 'Provincia Proveedor 1', '66666', 0), 
    (NULL, NULL, 2, NULL, 'Avenida Proveedor 2, #777', 'Ciudad Proveedor 2', 'Provincia Proveedor 2', '77777', 1),  
    (NULL, NULL, 2, NULL, 'Carrera Proveedor 2, #888', 'Ciudad Proveedor 2', 'Provincia Proveedor 2', '88888', 0), 
    (NULL, NULL, 3, NULL, 'Calle Proveedor 3, #999', 'Ciudad Proveedor 3', 'Provincia Proveedor 3', '99999', 1),  
    (NULL, NULL, 3, NULL, 'Avenida Proveedor 3, #000', 'Ciudad Proveedor 3', 'Provincia Proveedor 3', '00000', 0); 




-- CREACION DE VISTAS 
# Se crea una vista para tener en una sola tabla la información completa de los clientes
CREATE OR REPLACE VIEW vw_info_completa_clientes AS 
SELECT 
	c.nombre AS 'Nombre',
    c.apellido AS 'Apellido',
    e.email AS 'Email cliente',
    t.telefono AS 'Telefono cliente',
    d.direccion AS 'Direccion cliente'
FROM clientes AS c
JOIN emails AS e ON e.id_cliente = c.id
JOIN telefonos AS t ON t.id_cliente = c.id
JOIN direcciones AS d ON d.id_cliente = c.id
WHERE e.id_cliente IS NOT NULL AND t.id_cliente IS NOT NULL	
	AND email_principal = 1 
    AND telefono_principal = 1 
    AND direccion_principal = 1;

# Se crea una vista para tener informacion sobre los platos mas vendidos 
CREATE OR REPLACE VIEW vw_platos_mas_vendidos  AS
SELECT
	p.nombre_plato AS 'Nombre Plato'
    , COUNT(*) AS 'Cantidad'
FROM facturas AS f
JOIN platos AS p ON p.id = f.id_plato
GROUP BY p.nombre_plato 
ORDER BY COUNT(*) DESC;

# Se crea la vista de ingresos por categorias para hacer un informe sobre estas e implementar una estrategia de ventas
CREATE OR REPLACE VIEW vw_ingresos_por_categoria  AS
SELECT
	cp.nombre_categoria AS 'Categoria',
    SUM(f.subtotal_venta) AS 'Ingresos'
FROM categoria_plato AS cp
LEFT JOIN platos AS p ON p.id_categoria = cp.id
LEFT JOIN facturas AS f ON p.id = f.id_plato
GROUP BY cp.id, cp.nombre_categoria
ORDER BY SUM(f.subtotal_venta) DESC;

# Se crea una vista que ayude a consultar sobre los productos que se necesitan pedir
CREATE OR REPLACE VIEW vw_productos_a_pedir AS
SELECT
    p.id,
    p.nombre_producto AS nombre,
    s.id_proveedor,
    s.cantidad_stock AS cantidad_en_stock,
    (s.cantidad_ideal - s.cantidad_stock) AS cantidad_por_pedir
FROM
    productos p
JOIN
    stock s ON p.id = s.id_producto
WHERE
    s.cantidad_stock < s.cantidad_minima;
 
 # Se crea una vista con la información detallada de cada empleado, incluyendo aspectos relevantes de su rol en el restaurante
CREATE OR REPLACE VIEW vw_roles_empleados AS 
	SELECT 
		e.nombre,
        e.apellido,
        e.horario,
        r.nombre_rol AS rol,
		r.descripcion_rol AS descripcion,
        r.sueldo
	FROM empleados AS e 
    JOIN roles_restaurante AS r ON r.id = e.id_rol;
    
-- CREACION DE FUNCIONES 

# Función para caulcular el iva en Colombia

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
# Función para calcular el total de las facturas que comparten el mismo id de orden
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

# Función para calcular el total de una orden

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

-- STORED PROCEDURES 

DELIMITER $$

# El stored procedure 'ordenar tabla' se crea para que el usuario pueda ingresar el nombre de la tabla, nombre de columna y tipo de orden que serian 'ASC' o 'DESC', 
# estos deberan ser escritos tal cual para el correcto funcionamiento del stored procedure
DROP PROCEDURE IF EXISTS sp_ordenar_tabla$$
CREATE PROCEDURE sp_ordenar_tabla (IN nombre_tabla VARCHAR(25), nombre_columna VARCHAR(20), tipo_orden VARCHAR (4))
BEGIN
	IF nombre_tabla <> '' AND nombre_columna <> '' AND tipo_orden <> '' THEN # Se usa un 'AND' para asegurarnos que el usuario rellene todos los campos solicitados
		SET @tabla_orden = CONCAT('SELECT*FROM ', nombre_tabla,' ORDER BY ', nombre_columna, ' ', tipo_orden);
	
	END IF; 
    
    SET @consulta = CONCAT(@tabla_orden);
    
    PREPARE ejecutar FROM @consulta;
    EXECUTE ejecutar;
    DEALLOCATE PREPARE ejecutar;
    
END$$

DROP PROCEDURE IF EXISTS sp_ingresar_nuevos_platos$$
CREATE PROCEDURE sp_ingresar_nuevos_platos (IN categoria INT, nombre VARCHAR(40), descripcion VARCHAR(120), precio DECIMAL(9,2))
BEGIN 
	INSERT INTO platos (id_categoria, nombre_plato, descripcion_plato, precio_plato)
    VALUES (categoria,nombre,descripcion,precio);
END$$

# El stored procedure 'modificar_total_orden' se crea para corregir el total de la orden y asegurarnos que este valor esté correcto usando la función para calcular el total de la orden
DROP PROCEDURE IF EXISTS sp_modificar_total_orden$$
CREATE PROCEDURE sp_modificar_total_orden (IN id_orden INT)
BEGIN
	DECLARE total_orden_iva DECIMAL(9, 2);
    DECLARE subtotal_orden DECIMAL(9, 2);
    DECLARE total_orden_actual DECIMAL(9, 2);
	
    SELECT
        SUM(f.subtotal_venta) AS subtotal_orden,
        o.total_orden
    INTO subtotal_orden, total_orden_actual
    FROM orden AS o
    LEFT JOIN facturas AS f ON o.id = f.id_orden
    WHERE o.id = id_orden
    GROUP BY o.id;

    SET total_orden_iva = calcular_total_orden(id_orden);

    IF total_orden_iva <> total_orden_actual THEN
        UPDATE orden SET total_orden = total_orden_iva WHERE id = id_orden;
    END IF;
END$$
DELIMITER ;


-- Creación de Triggers

# Se crea una tabla complementaria la cual asociaremos al trigger cliente nuevo

CREATE TABLE IF NOT EXISTS restaurante_japones.log_clientes_nuevos (
	id INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_añadido DATE NOT NULL,
    name_user VARCHAR(80),
    PRIMARY KEY (id)
);
# Después se crea un trigger que permitira registrar nuevos clientes en la tabla llamada clientes
DROP TRIGGER IF EXISTS tr_cliente_nuevo;
CREATE TRIGGER tr_cliente_nuevo
AFTER INSERT ON  clientes
FOR EACH ROW 
	INSERT INTO log_clientes_nuevos (id_cliente, fecha_añadido, name_user)
    VALUES(NEW.id, curdate(), user());

# Se crea una tabla complementaria parecida a la tabla de facturas que asociaremos al trigger de eliminacion de facturas
CREATE TABLE IF NOT EXISTS log_facturas_eliminadas LIKE facturas;
ALTER TABLE log_facturas_eliminadas
	DROP id_orden,
	DROP COLUMN id_plato,
    DROP COLUMN cantidad_plato,
	ADD COLUMN fecha_eliminado DATE NOT NULL,
    ADD COLUMN name_user VARCHAR (80);
   
    
# Después creamos un trigger que permite guardar los datos importantes del registro que se elimino de la tabla de facturas en caso de ser necesitado o en caso de haber sido eliminado por error
DROP TRIGGER IF EXISTS tr_facturas_eliminadas;

DELIMITER $$
CREATE TRIGGER tr_facturas_eliminadas BEFORE DELETE ON facturas
	FOR EACH ROW
    BEGIN	
		INSERT INTO log_facturas_eliminadas (id, subtotal_venta, fecha_factura, fecha_eliminado, name_user)
        VALUES (OLD.id, OLD.subtotal_venta, OLD.fecha_factura, curdate(), user());
	END$$
