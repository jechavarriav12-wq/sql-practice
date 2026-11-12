# SQL Practice

Ejercicios de SQL resueltos sobre una base de datos de ventas y suscripciones (DuckDB), como parte de mi ruta hacia Data Engineer.

## Datos

Seis tablas: `vendedores`, `clientes`, `productos`, `ventas`, `seats` y `facturas`. Incluyen problemas de calidad a propósito (nulos, duplicados, registros huérfanos), como en un sistema real.

Para generar la base en local:

```bash
uv run --with duckdb python datos/setup_db.py
```

## Contenido

| Carpeta | Temas | Ejercicios |
|---|---|---|
| `01_basico` | WHERE, IN, BETWEEN, LIKE, IS NULL, ORDER BY, LIMIT, DISTINCT | 6 |
| `02_agregacion` | GROUP BY, HAVING, CASE WHEN, funciones de fecha | 7 |
| `03_joins` | INNER, LEFT, anti-join, joins de 3 tablas | 7 |

Cada archivo `.sql` trae el enunciado de negocio, la solución y lo que aprendí.

## Cómo correr una consulta

```bash
uv run --with duckdb python -c "import duckdb; print(duckdb.connect('datos/practica.duckdb').sql(open('01_basico/01_ventas_caribe_q1.sql', encoding='utf-8').read()))"
```

Dialecto: DuckDB (muy parecido a PostgreSQL). Las diferencias con BigQuery o PostgreSQL están anotadas en los ejercicios.
Agrego esta linea para comprobar como funciona Git 
