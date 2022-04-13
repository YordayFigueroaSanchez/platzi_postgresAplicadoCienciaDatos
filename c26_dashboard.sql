--class 26
---top10 (class 27)
--top 10 de la peliculas mas rentadas
select p.pelicula_id as id,
p.titulo,
count(*) as numero_renta,
row_number () over (
	order by count(*) desc  
) as orden
from rentas r  
	inner join inventarios i on (r.inventario_id = i.inventario_id)
	inner join peliculas p on (i.pelicula_id = p.pelicula_id)
group by p.pelicula_id
order by numero_renta desc 
limit 10
;

--actualizando precios
select p.pelicula_id, tc.tipo_cambio_id, tc.cambio_usd * p.precio_renta as precio_mxn 
from peliculas p, tipos_cambio tc
where tc.codigo = 'MXN'
;
--usando rank y percent rank
select p.pelicula_id as id,
p.titulo,
count(*) as numero_renta,
percent_rank() over (
	order by count(*) asc  
) as orden
from rentas r  
	inner join inventarios i on (r.inventario_id = i.inventario_id)
	inner join peliculas p on (i.pelicula_id = p.pelicula_id)
group by p.pelicula_id
order by numero_renta desc 
;
select p.pelicula_id as id,
p.titulo,
count(*) as numero_renta,
dense_rank() over (
	order by count(*) desc  
) as orden
from rentas r  
	inner join inventarios i on (r.inventario_id = i.inventario_id)
	inner join peliculas p on (i.pelicula_id = p.pelicula_id)
group by p.pelicula_id
order by numero_renta desc 
;
--ordenando datos geograficos
