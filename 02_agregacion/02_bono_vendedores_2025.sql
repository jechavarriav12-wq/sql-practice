-- Nivel 2 · HAVING
-- Enunciado: Vendedores con más de 20 ventas y total > 9.000 en 2025.
-- Aprendizaje: WHERE filtra filas antes de agrupar; HAVING filtra grupos. Orden lógico: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY.

SELECT vendedor_id,
       COUNT(*)   AS num_ventas,
       SUM(monto) AS total_vendido
FROM ventas
WHERE fecha >= '2025-01-01' AND fecha < '2026-01-01'
GROUP BY vendedor_id
HAVING COUNT(*) > 20 AND SUM(monto) > 9000   -- portable: sin alias en HAVING
ORDER BY total_vendido DESC;
