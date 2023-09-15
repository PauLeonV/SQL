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

  