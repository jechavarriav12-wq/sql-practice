SELECT vendedor_id,count(*) as ventas_sobre_promedio
FROM ventas 
WHERE monto>(SELECT avg(monto) as promedio FROM ventas WHERE region='Andina' AND fecha BETWEEN '2026-01-01' AND '2026-12-31' ) AND fecha BETWEEN '2026-01-01' AND '2026-12-31' AND region='Andina'
GROUP BY vendedor_id
ORDER BY ventas_sobre_promedio desc,vendedor_id;