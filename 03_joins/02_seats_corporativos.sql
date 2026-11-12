-- Nivel 3 · INNER JOIN (práctica)
-- Enunciado: Seats activos de clientes Corporativo en el plan de 1.250.
-- Aprendizaje: filtrar la tabla derecha de un LEFT JOIN en el WHERE lo vuelve INNER.

SELECT s.seat_id, c.nombre AS cliente, s.precio_mensual
FROM seats s
INNER JOIN clientes c ON s.cliente_id = c.cliente_id
WHERE s.status = 'activo'
  AND c.segmento = 'Corporativo'
  AND s.precio_mensual = 1250
ORDER BY s.seat_id;
