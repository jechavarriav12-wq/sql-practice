-- Nivel 2 · Fechas + GROUP BY
-- Enunciado: Ventas y total por mes de 2026 en la región Andina.
-- Aprendizaje: leer el requisito de negocio completo (la región); DATE_TRUNC no mezcla años.

SELECT DATE_TRUNC('month', fecha) AS mes,
       COUNT(*)   AS num_ventas,
       SUM(monto) AS total_vendido
FROM ventas
WHERE fecha >= '2026-01-01' AND fecha < '2027-01-01'
  AND region = 'Andina'
GROUP BY mes
ORDER BY mes;
