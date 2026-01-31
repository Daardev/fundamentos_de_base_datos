ALTER TABLE Clientes enable row level security;
ALTER table cuentas enable row level security; 

UPDATE Cuentas
SET saldo = saldo + 500.00
WHERE id_cuenta = 402;

DELETE FROM Cuentas
WHERE id_cuenta = 503;

--3. Listar el saldo de cada cuenta del cliente con más años de edad.
SELECT
  c.nombre nombre,
  c.edad edad,
  ct.saldo
FROM Clientes c
JOIN Cuentas ct ON c.id_cliente = ct.id_cliente
WHERE c.edad = (select max(edad) from clientes);

--4. Listar el promedio de edad de los clientes con saldo negativo.
SELECT
  ROUND(AVG(c.edad)) as promedio_edad
FROM Clientes c 
JOIN Cuentas ct ON c.id_cliente = ct.id_cliente
WHERE ct.saldo < 0;

--5. Listar el nombre y cantidad de cuentas de quienes tienen más de una.
SELECT 
  c.nombre,
  COUNT(ct.id_cuenta) AS cantidad_cuentas
FROM Clientes c
JOIN Cuentas ct ON c.id_cliente = ct.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(ct.id_cuenta) > 1
ORDER BY cantidad_cuentas DESC, c.nombre;

--6. Listar el saldo combinado (suma) de cada cliente con más de una cuenta
SELECT 
    c.nombre AS cliente,
    COUNT(ct.id_cuenta) AS cantidad_cuentas,
    SUM(ct.saldo) AS saldo_combinado
FROM Clientes c
JOIN Cuentas ct ON c.id_cliente = ct.id_cliente
GROUP BY c.id_cliente, c.nombre, c.edad
HAVING COUNT(ct.id_cuenta) > 1
ORDER BY saldo_combinado DESC;

/*7. Todos los clientes y su saldo combinado, considerando solo aquellos 
con al menos una cuenta con saldo negativo.*/
SELECT
  c.nombre,
  sum(ct.saldo) AS promedio_saldo
FROM Clientes c
join Cuentas ct ON c.id_cliente = ct.id_cliente
WHERE c.id_cliente IN (
    SELECT id_cliente 
    FROM Cuentas 
    WHERE saldo < 0
)
GROUP BY c.id_cliente, c.nombre
ORDER BY promedio_saldo DESC;