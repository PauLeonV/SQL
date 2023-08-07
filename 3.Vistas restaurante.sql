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


  
