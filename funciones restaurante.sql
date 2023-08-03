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





