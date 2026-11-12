-- Nivel 2 · Fechas (práctica)
-- Enunciado: Seats activados por año.
-- Aprendizaje: YEAR()/EXTRACT() devuelven un número; DATE_TRUNC() devuelve una fecha.

SELECT YEAR(fecha_inicio) AS anio,
       COUNT(*)           AS num_seats
FROM seats
GROUP BY anio
ORDER BY anio;
