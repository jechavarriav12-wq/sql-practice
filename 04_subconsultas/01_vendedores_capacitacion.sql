-- Nivel 4 · Subconsulta con IN
-- Enunciado: vendedores con al menos una venta mayor a 1.200.
-- Aprendizaje: IN no duplica filas (a diferencia de un JOIN), así que no hace falta DISTINCT.

SELECT vendedor_id, nombre, region
FROM vendedores
WHERE vendedor_id IN (SELECT vendedor_id FROM ventas WHERE monto > 1200)
ORDER BY vendedor_id;