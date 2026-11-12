-- Nivel 1 · ORDER BY + LIMIT
-- Enunciado: Las 5 ventas más grandes de 2025.
-- Aprendizaje: PostgreSQL pone los NULL primero con DESC; filtrar IS NOT NULL o usar NULLS LAST lo hace portable.

SELECT venta_id, fecha, vendedor_id, monto
FROM ventas
WHERE fecha >= '2025-01-01' AND fecha < '2026-01-01'
  AND monto IS NOT NULL
ORDER BY monto DESC
LIMIT 5;
