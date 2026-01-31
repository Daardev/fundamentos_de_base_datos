--1. insertar 9 series adicionales.

INSERT INTO serie_netflix (nombre, temporadas, genero, anio_estreno) VALUES
('Stranger Things', 4, 'Ciencia ficción/Terror', 2016),
('The Crown', 6, 'Drama histórico', 2016),
('La Casa de Papel', 5, 'Drama/Crimen', 2017),
('Bridgerton', 2, 'Drama romántico', 2020),
('Narcos', 3, 'Drama/Crimen', 2015),
('The Queen''s Gambit', 1, 'Drama', 2020),
('Dark', 3, 'Ciencia ficción/Misterio', 2017),
('Ozark', 4, 'Drama/Thriller', 2017),
('Breaking Bad', 5, 'Drama/Crimen', 2008);

SELECT * FROM serie_netflix;

--2. Listar todas las series con más de 3 temporadas ordenadas por año de estreno descendente

SELECT nombre, temporadas from serie_netflix
WHERE temporadas > 3
ORDER BY temporadas DESC;

--3. Listar el año de la serie más antigua

SELECT nombre, anio_estreno
FROM serie_netflix
WHERE anio_estreno = (SELECT MIN(anio_estreno) FROM serie_netflix);

--4. Listar el año de la serie más nueva

SELECT nombre, anio_estreno
FROM serie_netflix
WHERE anio_estreno = (SELECT MAX(anio_estreno) FROM serie_netflix);

--5. Mostrar el promedio de año de estreno de las series

SELECT
  ROUND(AVG (anio_estreno))
AS promedio_anio_estreno
FROM serie_netflix;

--6. Listar el promedio de temporadas de todas las series

SELECT 
  ROUND(AVG(temporadas)) AS promedio_temporadas
FROM serie_netflix;

--7. Listar las series que tengan 1, 2, 4, 5 o 7 temporadas

SELECT nombre, temporadas
FROM serie_netflix
WHERE temporadas IN (1,2,4,5,7)
ORDER BY temporadas ASC;

--8. Listar las series que NO tengan 1, 2, 4, 5 o 7 temporadas

SELECT nombre, temporadas
FROM serie_netflix
WHERE temporadas NOT IN (1,2,4,5,7)
ORDER BY temporadas DESC;

--9. Borrar todas las series con año de estreno superior a 2010

DELETE FROM serie_netflix
WHERE anio_estreno > 2010;

SELECT * FROM serie_netflix;

--10.Reinsertar los datos recién borrados

INSERT INTO serie_netflix (nombre, temporadas, genero, anio_estreno) VALUES
('Black Mirror', 5, 'Ciencia ficción', 2011),
('Stranger Things', 4, 'Ciencia ficción/Terror', 2016),
('The Crown', 6, 'Drama histórico', 2016),
('La Casa de Papel', 5, 'Drama/Crimen', 2017),
('Bridgerton', 2, 'Drama romántico', 2020),
('Narcos', 3, 'Drama/Crimen', 2015),
('The Queen''s Gambit', 1, 'Drama', 2020),
('Dark', 3, 'Ciencia ficción/Misterio', 2017),
('Ozark', 4, 'Drama/Thriller', 2017);

SELECT * FROM serie_netflix;

--11.Agregar la serie Doctor House, 8, ‘Drama Médico’, 2004 (si ya la tiene, agregue otra)

INSERT INTO serie_netflix(nombre, temporadas, genero, anio_estreno) values
('Doctor House', 8, 'Drama Médico', 2004);

SELECT * FROM serie_netflix;

--12.Listar todas las series estrenadas entre 2005 y 2020

SELECT * FROM serie_netflix
WHERE anio_estreno BETWEEN 2005 AND 2020;

--13.Listar todas aquellas series con nombre comenzado en B o terminado en e.

SELECT nombre, temporadas, genero, anio_estreno
FROM serie_netflix
WHERE nombre LIKE 'B%'
  OR nombre LIKE '%e'
ORDER BY nombre;

--14.Listar aquellas series cuyo año de entreno más la cantidad de temporadas excede 2010

SELECT nombre, anio_estreno, temporadas
FROM serie_netflix
WHERE (anio_estreno + temporadas) > 2010
ORDER BY nombre;