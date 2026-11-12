-- Nivel 2 · Fechas (práctica)
-- Enunciado: Días promedio activos de los seats dados de baja, por precio mensual.
-- Aprendizaje: toda columna del SELECT que no está agregada va en el GROUP BY.

SELECT precio_mensual,
       COUNT(*) AS num_bajas,
       ROUND(AVG(DATE_DIFF('day', fecha_inicio, fecha_baja)), 1) AS dias_promedio
FROM seats
WHERE status = 'baja'
GROUP BY precio_mensual
ORDER BY dias_promedio;
