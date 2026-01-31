--1. Listar todos los discos de bandas NO alemanas que hayan sido publicados desde el 2000 en adelante.
SELECT 
  b.nombre AS banda,
  b.pais,
  bd.nombre_disco,
  bd.anio_disco
FROM bandas b
JOIN bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE b.pais != 'Alemania'
  AND bd.anio_disco >= 2000
ORDER BY bd.anio_disco DESC, b.nombre;

--2. Listar el disco más reciente de las bandas inglesas que terminan en ‘s’.
SELECT 
  b.nombre AS banda,
  b.pais,
  bd.nombre_disco,
  bd.anio_disco
FROM bandas b
JOIN bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE b.pais = 'UK' AND b.nombre LIKE '%s'
AND bd.anio_disco = (
    SELECT MAX(anio_disco)
    FROM bandas_discos
    WHERE nombre_banda = b.nombre
  )
ORDER BY bd.anio_disco DESC;

--3. Listar todas las bandas alemanas con al menos un letra K en su nombre que tengan discos publicados en 1999 o superior.
SELECT
b.nombre,
b.pais,
bd.nombre_disco,
bd.anio_disco
from bandas b
join bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE b.pais = 'Alemania' AND b.nombre ilike '%k%'
AND bd.anio_disco >= 1999
ORDER BY bd.anio_disco DESC;

--4. Listar todas las bandas y el número de discos registrados
SELECT 
b.nombre,
COUNT(bd.nombre_disco) as discos
FROM bandas b
LEFT JOIN bandas_discos bd ON b.nombre = bd.nombre_banda
GROUP BY b.nombre
ORDER BY discos DESC, b.nombre;

--5. Mostrar todos los años en que todas las bandas sacaron un disco. Ordene la lista por año
SELECT
  b.nombre,
  bd.anio_disco
FROM bandas b
left join bandas_discos bd ON b.nombre = bd.nombre_banda
ORDER BY anio_disco ASC, b.nombre;

--6. Listar todas las bandas que tienen un disco con nombre empezado en A. Listar el nombre de la banda y del disco.
SELECT 
  b.nombre,
  bd.nombre_disco
FROM bandas b
left join bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE bd.nombre_disco ilike 'a%'
ORDER BY b.nombre ASC;

--7. Listar todas las bandas que tengan discos con más de una palabra. Listar el nombre de la banda y del disco.
SELECT
  b.nombre,
  bd.nombre_disco
FROM bandas b
join bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE bd.nombre_disco ilike '% %'
ORDER BY b.nombre, bd.nombre_disco;

--8. Listar todas las bandas que tengan discos con más de una palabra. Listar el nombre de la banda y la cantidad de discos.

SELECT 
    b.nombre,
    COUNT(d.nombre_disco)
FROM bandas b
JOIN bandas_discos d
    ON b.nombre = d.nombre_banda
GROUP BY b.nombre
ORDER BY COUNT(d.nombre_disco) DESC;