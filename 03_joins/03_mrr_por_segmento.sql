-- Nivel 3 · JOIN + GROUP BY (práctica)
-- Enunciado: MRR activo por segmento de cliente.
-- Aprendizaje: alias de tabla (s.columna) vs alias de columna (AS mrr): el punto va antes del AS, nunca después.

SELECT c.segmento,
       COUNT(*)              AS num_seats,
       SUM(s.precio_mensual) AS mrr
FROM seats s
INNER JOIN clientes c ON s.cliente_id = c.cliente_id
WHERE s.status = 'activo'
GROUP BY c.segmento
ORDER BY mrr DESC;
