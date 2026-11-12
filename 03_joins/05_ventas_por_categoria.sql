-- Nivel 3 · JOIN + GROUP BY
-- Enunciado: Ventas y total por categoría de producto en 2026.
-- Aprendizaje: INNER para reportes de negocio; LEFT para detectar huérfanos en revisiones de calidad.

SELECT p.categoria,
       COUNT(v.venta_id) AS num_ventas,
       SUM(v.monto)      AS total_vendido
FROM ventas v
INNER JOIN productos p ON v.producto_id = p.producto_id
WHERE v.fecha >= '2026-01-01' AND v.fecha < '2027-01-01'
GROUP BY p.categoria
ORDER BY total_vendido DESC;
