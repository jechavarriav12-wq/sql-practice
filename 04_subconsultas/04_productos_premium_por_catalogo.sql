SELECT producto_id, nombre, categoria, precio_lista 
           FROM productos
           WHERE precio_lista>(SELECT avg(precio_lista) FROM productos)
           ORDER BY precio_lista desc;