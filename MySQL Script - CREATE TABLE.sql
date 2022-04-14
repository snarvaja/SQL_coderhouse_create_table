DROP SCHEMA IF EXISTS sql_coderhouse_narvaja_santiago;

CREATE SCHEMA sql_coderhouse_narvaja_santiago;

CREATE TABLE `sql_coderhouse_narvaja_santiago`.`sucursales` (
  `id_sucursal` INT NOT NULL,
  `region` TEXT(10) NOT NULL,
  `nombre` TEXT(25) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE INDEX `id_sucursal_UNIQUE` (`id_sucursal` ASC) VISIBLE);
  
  
 CREATE TABLE `sql_coderhouse_narvaja_santiago`.`perfil_clientes` (
  `id_cliente` VARCHAR(25) NOT NULL,
  `tipo_dni` TEXT(5) NOT NULL,
  `numero_dni` BIGINT NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `antiguedad` INT,
  `empresa_b2b` VARCHAR(100) NULL,
  `segmento_RFM` TEXT(10) NOT NULL,
  `condicion_cliente` TEXT(10) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE);
  
  
  CREATE TABLE `sql_coderhouse_narvaja_santiago`.`articulos` (
  `id_articulo` INT NOT NULL,
  `grupo` TEXT(15) NOT NULL,
  `familia` TEXT(15) NOT NULL,
  `sector` TEXT(20) NOT NULL,
  `nombre` TEXT(100) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`id_articulo`),
  UNIQUE INDEX `id_articulo_UNIQUE` (`id_articulo` ASC) VISIBLE);
  
  CREATE TABLE `sql_coderhouse_narvaja_santiago`.`articulos_en_promocion` (
  `id_articulo_promocion` INT NOT NULL AUTO_INCREMENT,
  `id_articulo` INT NOT NULL,
  `nombre_articulo` TEXT(100) NOT NULL,
  `porcentaje_descuento` FLOAT NOT NULL,
  `tope_descuento` FLOAT NOT NULL,
  PRIMARY KEY (`id_articulo_promocion`),
  UNIQUE INDEX `id_articulo_promocion_UNIQUE` (`id_articulo_promocion` ASC) VISIBLE,
  FOREIGN KEY (id_articulo) REFERENCES `sql_coderhouse_narvaja_santiago`.`articulos`(id_articulo)
  );
  
  
CREATE TABLE `sql_coderhouse_narvaja_santiago`.`detalle_tickets` (
  `id_detalle_ticket` INT NOT NULL AUTO_INCREMENT,
  `numero_ticket` VARCHAR(30) NOT NULL,
  `id_sucursal` INT NOT NULL,
  `id_cliente` VARCHAR(25) NOT NULL,
  `id_articulo` INT NOT NULL,
  `unidades` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id_detalle_ticket`),
  UNIQUE INDEX `id_detalle_ticket_UNIQUE` (`id_detalle_ticket` ASC) VISIBLE, 
  FOREIGN KEY (id_sucursal) REFERENCES `sql_coderhouse_narvaja_santiago`.`sucursales`(id_sucursal),
  FOREIGN KEY (id_cliente) REFERENCES `sql_coderhouse_narvaja_santiago`.`perfil_clientes`(id_cliente),
  FOREIGN KEY (id_articulo) REFERENCES `sql_coderhouse_narvaja_santiago`.`articulos`(id_articulo)
  );