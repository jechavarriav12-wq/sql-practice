-- Nivel 2 · CASE WHEN
-- Enunciado: Distribución de las ventas de 2026 por tamaño (Grande / Mediana / Pequeña / Revisar).
-- Aprendizaje: el CASE clasifica cada fila; luego se agrupa por la etiqueta y se cuenta.

SELECT
    CASE
        WHEN monto >= 800 THEN 'Grande'
        WHEN monto >= 300 THEN 'Mediana'
        WHEN monto > 0    THEN 'Pequeña'
        ELSE 'Revisar'
    END      AS tamano,
    COUNT(*) AS num_ventas
FROM ventas
WHERE fecha >= '2026-01-01' AND fecha < '2027-01-01'
GROUP BY 1
ORDER BY num_ventas DESC;
