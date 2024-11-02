-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_Cliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `NIT` varchar(12) DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_Compra` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int DEFAULT NULL,
  `id_Proveedor` int DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Compra`),
  KEY `fk_compras_proveedores_idx` (`id_Proveedor`),
  CONSTRAINT `fk_compras_proveedores` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedores` (`id_Proveedor`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `id_Compra_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_Compra` int DEFAULT NULL,
  `id_Producto` int DEFAULT NULL,
  `precio_costo_unitario` decimal(8,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_Compra_detalle`),
  KEY `fk_compras_detalle_compras_idx` (`id_Compra`),
  KEY `fk_compras_detalle_productos_idx` (`id_Producto`),
  CONSTRAINT `fk_compras_detalle_compras` FOREIGN KEY (`id_Compra`) REFERENCES `compras` (`id_Compra`) ON DELETE CASCADE,
  CONSTRAINT `fk_compras_detalle_productos` FOREIGN KEY (`id_Producto`) REFERENCES `productos` (`id_Producto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_Empleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `DPI` varchar(15) DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_Puesto` smallint DEFAULT NULL,
  `fecha_inicio_labores` date DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Empleado`),
  KEY `fk_empleados_puestoos_idx` (`id_Puesto`),
  CONSTRAINT `fk_empleados_puestos` FOREIGN KEY (`id_Puesto`) REFERENCES `puestos` (`id_Puesto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `usuario` varchar(20) NOT NULL,
  `contraseña` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_Marca` smallint NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Marca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Dell'),(2,'Apple'),(3,'HP'),(4,'Asus'),(5,'Sony'),(6,'Lenovo'),(7,'Xiaomi'),(8,'Samsung'),(9,'Alienware'),(11,'Logitech');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_menu` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Productos',NULL,'Productos.jsp'),(2,'Marcas',1,'Marcas.jsp'),(3,'Ventas',NULL,'Ventas.jsp'),(4,'Clientes',3,'Clientes.jsp'),(5,'Empleados',3,'Empleados.jsp'),(6,'Puestos',5,'Puestos.jsp'),(7,'Compras',NULL,'Compras.jsp'),(8,'Proveedores',7,'Proveedores.jsp'),(9,'Reportes',NULL,'Reportes.jsp');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_Producto` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  `id_Marca` smallint DEFAULT NULL,
  `Descripcion` varchar(5000) DEFAULT NULL,
  `Imagen` varchar(1000) DEFAULT NULL,
  `precio_costo` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Producto`),
  KEY `fk_productos_marcas_idx` (`id_Marca`),
  CONSTRAINT `fk_productos_marcas` FOREIGN KEY (`id_Marca`) REFERENCES `marcas` (`id_Marca`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop',2,' Pantalla de	15\"	Otro	Procesador M2 Capacidad de memoria RAM	8 GB	Tipo Procesador	Chip M2 Almacenamiento	256 GB	Sistema Operativo	MAC OSX Conexion Wi-Fi	Si	Camara Web	Yes Pantalla tactil	No	Capacidad SSD	256 GB Conexion Bluetooth	Si	Tipo de uso	Premium Duracion de baterÃÂ­a	Hasta 18 hrs aprox*	Almacenamiento de estado solido	Yes','uploads\\239ba989-fab7-45f5-b2b6-49bcdbb9d683_MQKP3LLA_1.jpeg',8750.00,9500.00,5,'2024-11-03 08:40:00'),(2,'IPhone',2,'ios de garantia totales:	1	Operador	Tigo Sistema Operativo	iOS	Camara	48MP + 12MP + 48MP Otro	12 MP	Capacidad de memoria RAM	8 GB Color	Negro	Memoria Interna	256 GB Pantalla	6.9\"	Bateria	4500mAh Procesador	Si','uploads\\ce421205-9e10-4d03-9f96-74c3d581a14c_TIGOIPH16PMB_1.jpeg',10000.00,12500.00,10,'2024-11-04 08:47:00'),(3,'Laptop',7,' Pantalla	15.6\"	Otro	N/A Capacidad de memoria RAM	8 GB	Tipo Procesador	AMD Ryzen 3 Almacenamiento	512 GB	Sistema Operativo	Windows 11 Conexion Wi-Fi	Si	Camara Web	Yes Pantalla tactil	No	Capacidad SSD	512 GB Conexion Bluetooth	Si	Tipo de uso	Esencial Duracion de bateria	HASTA 7.5 HORAS	Almacenamiento de estado solido	Yes','uploads\\a3684e67-1549-4587-8ac6-0415b9211e97_82VG003FGJ_1_13122023174812.jpeg',3500.00,4000.00,3,'2024-11-06 14:52:00'),(4,'Laptop',3,' pantalla	15.6\"	Otro	N/A Capacidad de memoria RAM	8 GB	Tipo Procesador	Intel Core i5 Almacenamiento	N/A	Sistema Operativo	Windows 11 Conexion Wi-Fi	Si	Camara Web	Yes Pantalla tactil	No	Capacidad SSD	512 GB Conexion Bluetooth	Si	Tipo de uso	Esencial Duracion de bateria	HASTA 8 HORAS	Almacenamiento de estado solido	Yes','uploads\\58789c9a-9404-43ae-bcbd-e58f898991ad_hp15dy2503la.jpeg',4600.00,5200.00,5,'2024-11-02 09:17:00'),(5,'Mouse',11,'Mouse Logitech MX Master 3s Inalambrico Ultra Rapido con Clics Silenciosos (Gris Claro)','uploads\\2b2c2afa-9d8d-4c58-bee9-c23176da8671_910006562_1.jpeg',750.00,825.00,15,'2024-11-04 09:22:00'),(6,'Audífonos',8,'Audifonos Samsung Galaxy Buds FE In-Ear InalÃÂ¡mbricos con CancelaciÃÂ³n Activa de Ruido (Negro)','uploads\\5a557017-1658-4162-b884-7e3024fe29df_SMR400NZA_1_8112023172842.png',550.00,600.00,10,'2024-11-10 13:25:00'),(7,'Teléfono',8,' garantia totales	1	Operador	Claro Sistema Operativo	Android	Camara	200MPx+50MPx+12MPx+2MPX frontal 12MPx Otro	no	Capacidad de memoria RAM	12 GB Color	Gris	Memoria Interna	512 GB Pantalla	6.7\"	Bateria	5000mAh','uploads\\c6475ca8-5311-4ccb-ba06-409a687b5ae8_CLAROS24ULTRAG_1.png',10500.00,12700.00,4,'2024-11-05 10:28:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_Proveedor` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_Puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_Puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_Venta` int NOT NULL AUTO_INCREMENT,
  `no_factura` int DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `id_Cliente` int DEFAULT NULL,
  `id_Empleado` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Venta`),
  KEY `fk_ventas_clientes_idx` (`id_Cliente`),
  KEY `fk_ventas_empleados_idx` (`id_Empleado`),
  CONSTRAINT `fk_ventas_clientes` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id_Cliente`) ON DELETE CASCADE,
  CONSTRAINT `fk_ventas_empleados` FOREIGN KEY (`id_Empleado`) REFERENCES `empleados` (`id_Empleado`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `id_Venta_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_Venta` int DEFAULT NULL,
  `id_Producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_Venta_detalle`),
  KEY `fk_ventas_detalle_idx` (`id_Venta`),
  KEY `fk_ventas_detalle_productos_idx` (`id_Producto`),
  CONSTRAINT `fk_ventas_detalle_productos` FOREIGN KEY (`id_Producto`) REFERENCES `productos` (`id_Producto`),
  CONSTRAINT `fk_ventas_detalle_ventas` FOREIGN KEY (`id_Venta`) REFERENCES `ventas` (`id_Venta`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 23:20:23
