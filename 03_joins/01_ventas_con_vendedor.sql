-- Nivel 3 · INNER JOIN
-- Enunciado: Ventas del Caribe en octubre de 2026 con el nombre del vendedor.
-- Aprendizaje: con joins, prefijar todas las columnas con el alias de su tabla.

SELECT v.venta_id, v.fecha, ve.nombre AS vendedor, v.monto
FROM ventas v
INNER JOIN vendedores ve ON v.vendedor_id = ve.vendedor_id
WHERE v.fecha >= '2026-10-01' AND v.fecha < '2026-11-01'
  AND v.region = 'Caribe'
ORDER BY v.fecha, v.venta_id;
