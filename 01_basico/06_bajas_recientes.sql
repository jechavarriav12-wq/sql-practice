-- Nivel 1 · NULLs en ORDER BY (práctica)
-- Enunciado: Los 5 seats dados de baja más recientemente, portable entre motores.
-- Aprendizaje: quitar los NULL antes de ordenar evita depender del motor.

SELECT seat_id, cliente_id, fecha_baja
FROM seats
WHERE fecha_baja IS NOT NULL
ORDER BY fecha_baja DESC
LIMIT 5;
