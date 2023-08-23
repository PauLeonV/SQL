USE restaurante_japones;
DROP PROCEDURE IF EXISTS sp_registrar_venta;
DELIMITER $$

CREATE PROCEDURE sp_registrar_venta(IN in_id_cliente INT, IN in_id_empleado INT , IN in_domicilio TINYINT)
BEGIN
	DECLARE orden INT;
    IF in_id_empleado <= 0 OR in_id_cliente <= 0 THEN
		SIGNAL SQLSTATE '45000';
	ELSE
		START TRANSACTION;
        
		INSERT INTO orden(id_cliente,id_empleado, domicilio) 
		VALUES (in_id_cliente, in_id_empleado, in_domicilio);
    
		SET @orden = LAST_INSERT_ID();
		INSERT INTO facturas (id_orden, id_plato, cantidad_plato, subtotal_venta, fecha_factura)
		VALUES (@orden, 1,2, 22000, '2022-04-20'),
		(orden, 9,1, 15000, '2022-04-20'), 
		(orden, 13,2, 22000, '2022-04-20'), 
		(orden, 15,2, 12000, '2022-04-20'),
		(orden, 14,1, 5000, '2022-04-20');
	END IF;
    -- ROLLBACK;
    -- COMMIT;
END $$
    
DELIMITER ;

