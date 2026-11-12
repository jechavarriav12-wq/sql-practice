-- Nivel 2 · Fechas + HAVING (práctica)
-- Enunciado: Seats y MRR nuevo por trimestre de 2025, solo trimestres con más de 25 seats.
-- Aprendizaje: sin ORDER BY, SQL no garantiza ningún orden.

SELECT DATE_TRUNC('quarter', fecha_inicio) AS trimestre,
       COUNT(*)            AS num_seats,
       SUM(precio_mensual) AS mrr_nuevo
FROM seats
WHERE fecha_inicio >= '2025-01-01' AND fecha_inicio < '2026-01-01'
GROUP BY trimestre
HAVING COUNT(*) > 25
ORDER BY trimestre;
