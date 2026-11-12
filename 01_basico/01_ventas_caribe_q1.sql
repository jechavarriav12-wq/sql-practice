-- Nivel 1 · WHERE + BETWEEN + ORDER BY
-- Enunciado: Ventas del Caribe en el Q1 2026 con monto > 300, de mayor a menor monto.
-- Aprendizaje: BETWEEN incluye ambos extremos; para rangos de fecha es más seguro fecha >= inicio AND fecha < fin.

SELECT venta_id, fecha, cliente_id, monto
FROM ventas
WHERE monto > 300
  AND region = 'Caribe'
  AND fecha >= '2026-01-01' AND fecha < '2026-04-01'
ORDER BY monto DESC;
