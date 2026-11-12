-- Nivel 1 · LIKE + AND/OR
-- Enunciado: Productos cuyo nombre empieza por 'Crema' o 'Perfume' con precio < 100.
-- Aprendizaje: AND tiene prioridad sobre OR; los paréntesis definen la lógica. 'Crema%' = empieza con.

SELECT producto_id, nombre, categoria, precio_lista
FROM productos
WHERE precio_lista < 100
  AND (nombre LIKE 'Crema%' OR nombre LIKE 'Perfume%')
ORDER BY precio_lista ASC;
