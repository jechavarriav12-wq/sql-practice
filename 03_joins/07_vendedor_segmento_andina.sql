-- Nivel 3 · JOIN de 3 tablas
-- Enunciado: Top 5 combinaciones vendedor–segmento por total vendido en la región Andina, 2026.
-- Aprendizaje: la tabla de hechos (ventas) va en el centro y se le cuelgan las dimensiones (modelo estrella).

SELECT ve.nombre    AS vendedor,
       c.segmento,
       COUNT(*)     AS num_ventas,
       SUM(v.monto) AS total_vendido
FROM ventas v
INNER JOIN vendedores ve ON v.vendedor_id = ve.vendedor_id
INNER JOIN clientes   c  ON v.cliente_id  = c.cliente_id
WHERE v.fecha >= '2026-01-01' AND v.fecha < '2027-01-01'
  AND v.region = 'Andina'
GROUP BY ve.nombre, c.segmento
ORDER BY total_vendido DESC
LIMIT 5;
