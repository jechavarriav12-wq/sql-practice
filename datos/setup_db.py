import random, datetime as dt, sys
try:
    import duckdb
except ImportError:
    import subprocess
    subprocess.run([sys.executable, "-m", "pip", "install", "-q", "--break-system-packages", "duckdb"], check=True)
    import duckdb

random.seed(42)
con = duckdb.connect("datos/practica.duckdb")
for t in ["facturas", "seats", "ventas", "productos", "clientes", "vendedores"]:
    con.execute(f"DROP TABLE IF EXISTS {t}")

regiones = ["Andina", "Caribe", "Pacífico", "Orinoquía"]
ciudades = {"Andina": ["Bogotá", "Medellín", "Bucaramanga"], "Caribe": ["Barranquilla", "Cartagena"],
            "Pacífico": ["Cali", "Buenaventura"], "Orinoquía": ["Villavicencio"]}
nombres = ["Ana", "Luis", "Sara", "Pedro", "Camila", "Andrés", "Valentina", "Jorge", "Laura", "Felipe",
           "Daniela", "Mateo", "Paula", "Santiago", "Juliana"]

con.execute("CREATE TABLE vendedores (vendedor_id INT, nombre VARCHAR, region VARCHAR, fecha_ingreso DATE, jefe_id INT)")
vend = [(1, "Marta", "Andina", dt.date(2021, 3, 1), None), (2, "Ricardo", "Caribe", dt.date(2021, 6, 15), 1)]
for i, n in enumerate(nombres[:10], start=3):
    r = random.choice(regiones)
    vend.append((i, n, r, dt.date(2022, 1, 1) + dt.timedelta(days=random.randint(0, 1200)), random.choice([1, 2])))
con.executemany("INSERT INTO vendedores VALUES (?,?,?,?,?)", vend)

con.execute("CREATE TABLE clientes (cliente_id INT, nombre VARCHAR, ciudad VARCHAR, segmento VARCHAR, email VARCHAR, fecha_registro DATE)")
cli = []
for i in range(1, 41):
    r = random.choice(regiones)
    email = None if i % 9 == 0 else f"cliente{i}@correo.com"
    ciudad = "" if i % 13 == 0 else random.choice(ciudades[r])
    cli.append((i, f"Cliente {i}", ciudad, random.choice(["Pyme", "Corporativo", "Persona"]), email,
                dt.date(2023, 1, 1) + dt.timedelta(days=random.randint(0, 1000))))
con.executemany("INSERT INTO clientes VALUES (?,?,?,?,?,?)", cli)

con.execute("CREATE TABLE productos (producto_id INT, nombre VARCHAR, categoria VARCHAR, precio_lista DECIMAL(10,2))")
cats = {"Cuidado facial": ["Crema hidratante", "Protector solar", "Sérum", "Limpiador"],
        "Maquillaje": ["Base", "Labial", "Pestañina"], "Perfumería": ["Perfume floral", "Perfume cítrico", "Colonia"],
        "Cuidado corporal": ["Jabón", "Crema corporal"]}
prods, pid = [], 1
for c, items in cats.items():
    for it in items:
        prods.append((pid, it, c, round(random.uniform(15, 180), 2))); pid += 1
con.executemany("INSERT INTO productos VALUES (?,?,?,?)", prods)

con.execute("CREATE TABLE ventas (venta_id INT, fecha DATE, vendedor_id INT, cliente_id INT, producto_id INT, cantidad INT, monto DECIMAL(12,2), region VARCHAR)")
ven = []
vendedores_activos = [v[0] for v in vend if v[0] not in (11, 12)]
for i in range(1, 401):
    v = random.choice(vendedores_activos)
    p = random.choice(prods)
    q = random.randint(1, 10)
    monto = round(float(p[3]) * q * random.uniform(0.85, 1.0), 2)
    if i % 47 == 0: monto = None
    if i % 61 == 0: monto = -monto
    f = dt.date(2025, 1, 1) + dt.timedelta(days=random.randint(0, 670))
    ven.append((i, f, v, random.randint(1, 40), p[0], q, monto, vend[v - 1][2]))
for dup in (5, 77, 150):
    d = list(ven[dup - 1]); d[0] = 400 + dup; ven.append(tuple(d))
con.executemany("INSERT INTO ventas VALUES (?,?,?,?,?,?,?,?)", ven)

con.execute("CREATE TABLE seats (seat_id INT, cliente_id INT, status VARCHAR, fecha_inicio DATE, fecha_baja DATE, precio_mensual DECIMAL(10,2))")
con.execute("CREATE TABLE facturas (factura_id INT, seat_id INT, cliente_id INT, periodo DATE, monto DECIMAL(10,2), credito DECIMAL(10,2))")
seats, facts, fid = [], [], 1
for s in range(1, 121):
    inicio = dt.date(2025, 1, 1) + dt.timedelta(days=random.randint(0, 400))
    baja = inicio + dt.timedelta(days=random.randint(60, 300)) if s % 6 == 0 else None
    status = "baja" if baja else "activo"
    precio = random.choice([800, 950, 1100, 1250])
    seats.append((s, random.randint(1, 40), status, inicio, baja, precio))
    if s % 17 == 0:
        continue
    credito = round(precio * 0.1, 2) if s % 11 == 0 else 0
    facts.append((fid, s, seats[-1][1], dt.date(2026, 9, 1), precio, credito)); fid += 1
    if s % 29 == 0:
        facts.append((fid, s, seats[-1][1], dt.date(2026, 9, 1), precio, credito)); fid += 1
facts.append((fid, 999, 3, dt.date(2026, 9, 1), 950, 0))
con.executemany("INSERT INTO seats VALUES (?,?,?,?,?,?)", seats)
con.executemany("INSERT INTO facturas VALUES (?,?,?,?,?,?)", facts)

for t in ["vendedores", "clientes", "productos", "ventas", "seats", "facturas"]:
    print(t, con.execute(f"SELECT COUNT(*) FROM {t}").fetchone()[0])
