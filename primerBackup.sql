-- Tablas incluidad: categoria_plato, clientes, direcciones, emails, empleados, facturas, ingredientes, orden, paises_proveedores, pedidos,
-- platos, productos, proveedores, roles_restaurante, stock, telefonos
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurante_japones
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `categoria_plato`
--

LOCK TABLES `categoria_plato` WRITE;
/*!40000 ALTER TABLE `categoria_plato` DISABLE KEYS */;
INSERT INTO `categoria_plato` VALUES (1,'Entrada'),(2,'Sopas/Ramen'),(3,'Plato fuerte'),(4,'Postre'),(5,'Bebida'),(6,'Plato infantil'),(7,'Adicional'),(8,'prueba1'),(9,'prueba2');
/*!40000 ALTER TABLE `categoria_plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Britni','Hollidge','CC','12363236'),(2,'Frederick','Varne','TI','29473260'),(3,'Lucius','Bernuzzi','CC','37320641'),(4,'Tracie','Cettell','DNI','43352500'),(5,'Christiano','Freer','DNI','48588106'),(6,'Wilmette','Penylton','TI','24563964'),(7,'Gerome','Feye','CC','33552952'),(8,'Sigrid','Couth','TI','12780506'),(9,'Cristine','Brannon','CI','19000076'),(10,'Baily','Timny','CI','11675544'),(11,'Calli','Muckley','DNI','33615308'),(12,'Jeth','Gillion','CI','10598309'),(13,'Coleman','Fruser','CC','38298528'),(14,'Kingsly','Simon','CC','32759213'),(15,'Alidia','Fernant','CC','46012914'),(16,'Bronnie','Salandino','CI','37794109'),(17,'Kelsy','Poile','CI','10797385'),(18,'Tommy','Lawrence','CI','16207656'),(19,'Robinetta','Wynes','CI','35315023'),(20,'Mollee','Cotelard','DNI','26937341');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,1,NULL,NULL,NULL,'Calle 123, #456','Ciudad Cliente 1','Provincia Cliente 1','12345',1),(2,1,NULL,NULL,NULL,'Avenida 987, #654','Ciudad Cliente 1','Provincia Cliente 1','54321',0),(3,2,NULL,NULL,NULL,'Calle 456, #789','Ciudad Cliente 2','Provincia Cliente 2','67890',1),(4,2,NULL,NULL,NULL,'Avenida 321, #987','Ciudad Cliente 2','Provincia Cliente 2','09876',0),(5,3,NULL,NULL,NULL,'Carrera 111, #222','Ciudad Cliente 3','Provincia Cliente 3','11111',1),(6,3,NULL,NULL,NULL,'Calle 999, #888','Ciudad Cliente 3','Provincia Cliente 3','88888',0),(7,NULL,1,NULL,NULL,'Avenida Empleado 1, #111','Ciudad Empleado 1','Provincia Empleado 1','11111',1),(8,NULL,1,NULL,NULL,'Carrera Empleado 1, #222','Ciudad Empleado 1','Provincia Empleado 1','22222',0),(9,NULL,2,NULL,NULL,'Calle Empleado 2, #333','Ciudad Empleado 2','Provincia Empleado 2','33333',1),(10,NULL,2,NULL,NULL,'Avenida Empleado 2, #444','Ciudad Empleado 2','Provincia Empleado 2','44444',0),(11,NULL,NULL,1,NULL,'Carrera Proveedor 1, #555','Ciudad Proveedor 1','Provincia Proveedor 1','55555',1),(12,NULL,NULL,1,NULL,'Calle Proveedor 1, #666','Ciudad Proveedor 1','Provincia Proveedor 1','66666',0),(13,NULL,NULL,2,NULL,'Avenida Proveedor 2, #777','Ciudad Proveedor 2','Provincia Proveedor 2','77777',1),(14,NULL,NULL,2,NULL,'Carrera Proveedor 2, #888','Ciudad Proveedor 2','Provincia Proveedor 2','88888',0),(15,NULL,NULL,3,NULL,'Calle Proveedor 3, #999','Ciudad Proveedor 3','Provincia Proveedor 3','99999',1),(16,NULL,NULL,3,NULL,'Avenida Proveedor 3, #000','Ciudad Proveedor 3','Provincia Proveedor 3','00000',0);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,1,NULL,NULL,'cliente1@example.com',1),(2,1,NULL,NULL,'cliente1_secundario@example.com',0),(3,2,NULL,NULL,'cliente2@example.com',1),(4,2,NULL,NULL,'cliente2_secundario@example.com',0),(5,3,NULL,NULL,'cliente3@example.com',1),(6,3,NULL,NULL,'cliente3_secundario@example.com',0),(7,NULL,1,NULL,'empleado1@example.com',1),(8,NULL,1,NULL,'empleado1_secundario@example.com',0),(9,NULL,2,NULL,'empleado2@example.com',1),(10,NULL,2,NULL,'empleado2_secundario@example.com',0),(11,NULL,NULL,1,'proveedor1@example.com',1),(12,NULL,NULL,1,'proveedor1_secundario@example.com',0),(13,NULL,NULL,2,'proveedor2@example.com',1),(14,NULL,NULL,2,'proveedor2_secundario@example.com',0),(15,NULL,NULL,3,'proveedor3@example.com',1),(16,NULL,NULL,3,'proveedor3_secundario@example.com',0);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,2,'Kellsie','Marushak','09:17:56'),(2,1,'Otha','Pady','12:30:03'),(3,4,'Rollo','Stockey','11:43:05'),(4,4,'Linus','Letterese','12:32:10'),(5,2,'Yolanda','McLay','12:55:38'),(6,7,'Kimbra','Shipcott','12:10:16'),(7,4,'Mavra','Domelaw','10:22:11'),(8,5,'Rickert','Leyfield','11:15:19'),(9,7,'Casandra','Hambleton','11:44:55'),(10,8,'Deidre','Schnieder','12:29:10'),(11,7,'Chery','Cowan','11:58:46'),(12,8,'Fionna','Whate','09:27:19'),(13,5,'Crissy','Leabeater','12:05:25'),(14,4,'Nobe','Kilvington','09:20:27'),(15,6,'Kariotta','Asling','10:55:34'),(16,3,'Lyndy','Sessions','11:05:38'),(17,4,'Bobbie','Wathan','10:16:58'),(18,8,'Laraine','Seefeldt','11:45:09'),(19,8,'Joann','Costen','12:00:22'),(20,4,'Cicily','MacCahee','12:30:46');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,1,11,4,108000.00,'2022-04-10'),(2,1,17,4,24000.00,'2022-04-10'),(3,1,3,8,140000.00,'2022-04-10'),(4,1,20,5,82500.00,'2022-04-10'),(5,1,8,1,85000.00,'2022-04-10'),(6,1,16,4,24000.00,'2022-04-10'),(7,1,20,5,82500.00,'2022-04-10'),(8,1,22,1,8000.00,'2022-04-10'),(9,2,20,5,82500.00,'2022-04-10'),(10,2,12,3,42000.00,'2022-04-10'),(11,2,19,3,57500.00,'2022-04-10'),(12,3,21,1,6500.00,'2022-04-11'),(13,3,10,3,66000.00,'2022-04-11'),(14,4,5,4,62000.00,'2022-04-11'),(15,4,15,1,6000.00,'2022-04-11'),(16,4,24,2,7000.00,'2022-04-11'),(17,5,6,2,44000.00,'2022-04-11'),(18,5,10,1,22000.00,'2022-04-11'),(19,6,8,1,85000.00,'2022-04-12'),(20,6,9,2,30000.00,'2022-04-12'),(21,7,12,4,56000.00,'2022-04-12'),(22,7,13,2,22000.00,'2022-04-12'),(23,8,6,1,22000.00,'2022-04-12'),(24,8,9,1,15000.00,'2022-04-12'),(25,8,14,1,5000.00,'2022-04-12'),(26,9,6,1,22000.00,'2022-04-12'),(27,9,9,2,30000.00,'2022-04-12'),(28,10,1,1,11000.00,'2022-04-12'),(29,10,10,1,22000.00,'2022-04-12'),(30,11,8,2,170000.00,'2022-04-13'),(31,11,9,2,30000.00,'2022-04-13'),(32,12,10,1,22000.00,'2022-04-13'),(33,13,16,1,6000.00,'2022-04-13'),(34,14,1,1,11000.00,'2022-04-13'),(35,14,10,1,22000.00,'2022-04-13'),(36,14,15,1,6000.00,'2022-04-13'),(37,15,18,1,19500.00,'2022-04-14'),(38,16,17,1,6000.00,'2022-04-14'),(39,17,1,1,11000.00,'2022-04-14'),(40,17,10,1,22000.00,'2022-04-14'),(41,18,18,1,19500.00,'2022-04-14'),(42,19,19,1,15500.00,'2022-04-14'),(43,20,6,1,22000.00,'2022-04-14'),(44,20,7,1,22000.00,'2022-04-14');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,1,0.05),(1,6,0.20),(1,22,0.01),(2,2,0.04),(2,23,0.02),(3,3,0.12),(3,5,0.03),(4,4,0.01),(5,5,0.10),(6,6,0.10),(6,24,0.01),(7,7,0.10),(8,8,0.10),(9,9,0.10),(10,10,0.15),(10,21,0.10),(11,10,0.20),(11,22,0.10),(12,12,0.05),(13,13,0.10),(13,14,0.02),(14,14,0.50),(15,15,0.60),(16,16,0.60),(17,17,0.60),(18,18,0.20),(19,19,0.10),(20,20,0.20),(21,21,0.30),(21,9,0.10),(22,9,0.20),(22,18,0.05),(23,23,0.20),(24,14,0.05);
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,7,3,471500.00,0),(2,4,17,182000.00,1),(3,4,17,72500.00,0),(4,16,7,75000.00,1),(5,15,3,70500.00,1),(6,17,7,288000.00,1),(7,4,7,154500.00,1),(8,5,7,222000.00,1),(9,17,4,31000.00,0),(10,7,14,283500.00,1),(11,20,20,39000.00,1),(12,7,4,31500.00,0),(13,17,20,387000.00,1),(14,4,3,95500.00,1),(15,1,7,320500.00,0),(16,18,17,41000.00,1),(17,19,7,14500.00,1),(18,12,4,31500.00,1),(19,16,14,389000.00,0),(20,1,4,424000.00,1);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paises_proveedores`
--

LOCK TABLES `paises_proveedores` WRITE;
/*!40000 ALTER TABLE `paises_proveedores` DISABLE KEYS */;
INSERT INTO `paises_proveedores` VALUES (1,'Colombia',57,'COP'),(2,'Japon',81,'JPY'),(3,'China',86,'CNY'),(4,'Taiwan',886,'TWD');
/*!40000 ALTER TABLE `paises_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,1,10,30000.00,'2022-03-15'),(2,2,1,8,24000.00,'2022-03-16'),(3,3,2,5,9000.00,'2022-03-17'),(4,4,3,3,18000.00,'2022-03-18'),(5,5,3,6,54000.00,'2022-03-19'),(6,6,4,12,30000.00,'2022-03-20'),(7,7,4,7,18900.00,'2022-03-21'),(8,8,5,4,80000.00,'2022-03-22'),(9,9,5,9,7200.00,'2022-03-23'),(10,10,6,15,42000.00,'2022-03-24'),(11,11,7,18,54000.00,'2022-03-25'),(12,12,8,7,21000.00,'2022-03-26'),(13,13,8,5,10000.00,'2022-03-27'),(14,14,9,20,30000.00,'2022-03-28'),(15,15,9,15,45000.00,'2022-03-29'),(16,16,10,8,24000.00,'2022-03-30'),(17,17,10,3,12000.00,'2022-03-31'),(18,18,1,6,18000.00,'2022-03-01'),(19,19,1,10,35000.00,'2022-03-02'),(20,20,2,12,36000.00,'2022-03-03'),(21,21,2,9,27000.00,'2022-03-04'),(22,22,3,15,45000.00,'2022-03-05'),(23,23,3,4,16000.00,'2022-03-06'),(24,24,4,10,30000.00,'2022-03-07');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
INSERT INTO `platos` VALUES (1,1,'Gyozas de cerdo','6 Gyozas rellenas de cerdo con soja',11000.00),(2,1,'Gyozas vegetarianas','6 gyozas rellenas de repollo,zuchini y champiñon',9000.00),(3,1,'Crab Salad','Palmito de cangrejo premium, spicy mayo, tobiko y aguacate',17500.00),(4,1,'Nigiri Salmón','Arroz de sushi y 3 unidades de salmón',15500.00),(5,1,'Sashimi Salmón','Salmón crudo',15500.00),(6,2,'Shoyu Ramen','Ramen con caldo a base de soya y cerdo acompañado con noodels artesanales',22000.00),(7,2,'Miso Ramen','Ramen con caldo de miso y cerdo, huevo marinado, cebolla, repollo, cerdo con especies japones',22000.00),(8,2,'Ramen de langosta','Ramen con caldo a base de pescado y ondashi,langosta adobada con especies y mantequilla artesanal',85000.00),(9,2,'Sopa Miso','Sopa con miso con verduras cocidas y noodles artesanales',15000.00),(10,3,'Wok al curry','Wok con cerdo, pimentón, ceboola y zucchini, salteado al curry con arroz o noodles',22000.00),(11,3,'Spicy Wok','Wok con carne y pollo, raices, cebolla,s iracha, zucchini,maiz y picantes',27000.00),(12,4,'Moshi','Dulce tradicional japones relleno de helado',14000.00),(13,4,'Banana tempura','Banano en trozos con tempura acompañado de leche condensada',11000.00),(14,5,'Agua','',5000.00),(15,5,'Gaseosas marca Postobon','',6000.00),(16,5,'Coca Cola','',6000.00),(17,5,'Limonada Natural','',6000.00),(18,6,'Chicken Finger','Pollo frito en forma de dedos',19500.00),(19,6,'Sushi Burger','',15500.00),(20,6,'Ramen Pequeño','',165000.00),(21,7,'Noodles','',6500.00),(22,7,'Proteina','',9000.00),(23,7,'Alga Nori','',1500.00),(24,7,'Tempura','',3500.00);
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,1,'Empaque de Gyozas de cerdo',0.20,1500.00),(2,2,1,'Empaque de Gyozas vegetarianas',0.18,1300.00),(3,3,2,'Empaque de Crab Salad',0.25,1800.00),(4,4,3,'Nigiri Salmón fresco',0.05,6000.00),(5,5,3,'Sashimi Salmón fresco',0.10,9000.00),(6,6,4,'Empaque de Shoyu Ramen',0.30,2500.00),(7,7,4,'Empaque de Miso Ramen',0.30,2700.00),(8,8,4,'Langosta adobada con especies',0.15,20000.00),(9,9,4,'Sopa Miso instantánea',0.10,800.00),(10,10,5,'Salsa de curry',0.50,1200.00),(11,11,5,'Salsa Spicy Wok',0.60,1500.00),(12,12,5,'Arroz para Moshi',0.25,800.00),(13,13,5,'Harina para tempura',0.35,1000.00),(14,14,6,'Botella de agua',0.50,1500.00),(15,15,6,'Botella de gaseosa Postobon',0.60,1800.00),(16,16,6,'Botella de Coca Cola',0.60,1800.00),(17,17,6,'Jugoso Limonada Natural',0.60,2000.00),(18,18,7,'Empaque de Chicken Finger',0.25,3500.00),(19,19,7,'Empaque de Sushi Burger',0.30,3000.00),(20,20,7,'Empaque de Ramen Pequeño',0.20,2800.00),(21,21,8,'Noodles artesanales',0.30,5000.00),(22,22,8,'Pollo fresco',0.50,6000.00),(23,23,8,'Alga Nori para sushi',0.05,3000.00),(24,24,9,'Vegetales frescos para tempura',0.30,4000.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,1,'Jú','Coppeard','CC','0922239878'),(2,4,'Eliès','Parham','DNI','6624543213'),(3,1,'Åslög','Feldharker','CI','5382758336'),(4,1,'Marie-josée','Dawdry','CC','8155939073'),(5,1,'Mårten','Eliaz','CI','2546979175'),(6,2,'Lài','Olphert','CI','4869678888'),(7,3,'Cloé','Moulton','DNI','5372802855'),(8,3,'Rachèle','Miche','DNI','9439378026'),(9,3,'Andrée','Prazor','DNI','5170048971'),(10,1,'Ruì','Grason','CC','2293843912');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles_restaurante`
--

LOCK TABLES `roles_restaurante` WRITE;
/*!40000 ALTER TABLE `roles_restaurante` DISABLE KEYS */;
INSERT INTO `roles_restaurante` VALUES (1,'Gerente del restaurante','Responsable de supervisar todas las operaciones,garantizar el cumplimiento de normas y regulaciones, gestionar el personal y administrar el presupuesto',2500000.00),(2,'Chef ejecutivo','Encargado de crear el menú, supervisar la preparación de los platos y mantener altos estándares de calidad en la cocina',2200000.00),(3,'Cocinero','Preparan los alimentos según las recetas y las indicaciones del chef ejecutivo. Pueden haber diferentes cocineros especializados, como cocineros de línea, pasteleros, etc',1800000.00),(4,'Personal de servicio','Incluye camareros, camareras y meseros que atienden a los clientes en el comedor, toman pedidos y sirven los alimentos y bebidas',1500000.00),(5,'Anfitrión','Reciben a los clientes en la entrada del restaurante, los conducen a sus mesas y gestionan las reservaciones',1700000.00),(6,'Gerente de eventos','Si el restaurante organiza eventos especiales, este rol se encarga de su planificación y ejecución',1500000.00),(7,'Personal de marketing y relaciones públicas','Responsables de promocionar el restaurante, gestionar las redes sociales y mantener una buena imagen pública',1200000.00),(8,'Gerente de finanzas o contabilidad','Encargado de llevar la contabilidad, el presupuesto y las finanzas del restaurante',2200000.00);
/*!40000 ALTER TABLE `roles_restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,2,20,15,180),(2,1,10,30,250),(3,2,10,30,160),(4,3,15,10,100),(5,3,12,12,110),(6,5,20,45,350),(7,4,18,40,350),(8,6,10,10,100),(9,6,15,12,110),(10,7,20,50,400),(11,7,25,45,350),(12,8,18,40,350),(13,8,5,10,100),(14,9,6,12,110),(15,9,20,50,400),(16,10,18,45,350),(17,10,18,40,350),(18,1,5,10,100),(19,1,6,12,110),(20,2,20,50,400),(21,2,18,45,350),(22,3,18,40,350),(23,3,5,10,100),(24,4,6,12,110);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES (1,1,NULL,NULL,123456789,1),(2,1,NULL,NULL,987654321,0),(3,2,NULL,NULL,555555555,1),(4,2,NULL,NULL,777777777,0),(5,3,NULL,NULL,111111111,1),(6,3,NULL,NULL,999999999,0),(7,NULL,1,NULL,444444444,1),(8,NULL,1,NULL,666666666,0),(9,NULL,2,NULL,222222222,1),(10,NULL,2,NULL,888888888,0),(11,NULL,NULL,1,777777777,1),(12,NULL,NULL,1,999999999,0),(13,NULL,NULL,2,111111111,1),(14,NULL,NULL,2,333333333,0),(15,NULL,NULL,3,555555555,1),(16,NULL,NULL,3,888888888,0);
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


