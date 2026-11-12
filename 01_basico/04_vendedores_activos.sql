-- Nivel 1 · DISTINCT
-- Enunciado: Combinaciones únicas región–vendedor con ventas desde el 1 de julio de 2026.
-- Aprendizaje: ORDER BY con varias columnas; no agregar filtros que el requerimiento no pide.

SELECT DISTINCT region, vendedor_id
FROM ventas
WHERE fecha >= '2026-07-01'
ORDER BY region, vendedor_id;
