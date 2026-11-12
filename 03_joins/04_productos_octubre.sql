-- Nivel 3 · LEFT JOIN (práctica)
-- Enunciado: Todos los productos con su número de ventas en octubre de 2026, incluidos los de 0.
-- Aprendizaje: lo que no puedes perder va a la izquierda; filtros de la derecha en el ON; COUNT de una columna de la derecha.

SELECT p.producto_id,
       p.nombre          AS producto,
       COUNT(v.venta_id) AS num_ventas
FROM productos p
LEFT JOIN ventas v
    ON  p.producto_id = v.producto_id
    AND v.fecha >= '2026-10-01'
    AND v.fecha <  '2026-11-01'
GROUP BY p.producto_id, p.nombre
ORDER BY num_ventas, p.producto_id;
