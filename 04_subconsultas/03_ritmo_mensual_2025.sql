SELECT ROUND(AVG(total_mes),2) AS promedio_mensual, MAX(total_mes) as mejor_mes, MIN(total_mes) as peor_mes
FROM (SELECT DATE_TRUNC('month',fecha) AS mes, sum(monto) AS  total_mes FROM ventas WHERE fecha BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY mes);