-- Nivel 2 · GROUP BY + COUNT/SUM
-- Enunciado: Número de ventas y total vendido por región en el primer semestre de 2026.
-- Aprendizaje: COUNT(*) cuenta filas; COUNT(columna) ignora los NULL.

SELECT region,
       COUNT(*)   AS num_ventas,
       SUM(monto) AS total_vendido
FROM ventas
WHERE fecha >= '2026-01-01' AND fecha < '2026-07-01'
GROUP BY region
ORDER BY total_vendido DESC;
