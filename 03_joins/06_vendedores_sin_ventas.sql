-- Nivel 3 · Anti-join
-- Enunciado: Vendedores que nunca han registrado una venta.
-- Aprendizaje: LEFT JOIN + WHERE llave_derecha IS NULL = lo que está en A y no en B.

SELECT ve.vendedor_id, ve.nombre, ve.region
FROM vendedores ve
LEFT JOIN ventas v ON ve.vendedor_id = v.vendedor_id
WHERE v.venta_id IS NULL
ORDER BY ve.vendedor_id;
