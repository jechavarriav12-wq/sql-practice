-- Nivel 1 · IS NULL + IN
-- Enunciado: Clientes Pyme o Corporativo sin email registrado.
-- Aprendizaje: NULL se compara con IS NULL, nunca con = NULL. ASC es el orden por defecto.

SELECT cliente_id, nombre, segmento, ciudad
FROM clientes
WHERE email IS NULL
  AND segmento IN ('Pyme', 'Corporativo')
ORDER BY cliente_id;
