-- Creación de Stored Proceduces
USE restaurante_japones;

DELIMITER $$

-- El stored procedure 'ordenar tabla' se crea para que el usuario pueda ingresar el nombre de la tabla, nombre de columna y tipo de orden que serian 'ASC' o 'DESC', estos deberan ser
-- escritos tal cual para el correcto funcionamiento del stored procedure

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

-- El stored procedure 'modificar_total_orden' se crea para corregir el total de la orden y asegurarnos que este valor esté correcto usando la función para calcular el total de la orden
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
