--datos en el tiempo
--class 31
select date_part('year', r.fecha_renta) as anio,
date_part('month', r.fecha_renta) as mes,
p.titulo,
count(*) as numero_rentas 
from rentas r 
inner join inventarios i on (r.inventario_id = i.inventario_id)
inner join peliculas p on (i.pelicula_id = p.pelicula_id)
group by anio, mes, p.titulo 
order by numero_rentas desc 
;

select date_part('year', r.fecha_renta) as anio,
date_part('month', r.fecha_renta) as mes,
count(*) as numero_rentas 
from rentas r 
group by anio, mes 
order by anio, mes
;