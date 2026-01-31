--1.A quién(es) le debe más dinero y cuánto
SELECT nombre, le_debo
FROM finanzas_personales
WHERE le_debo = (SELECT MAX(le_debo) FROM finanzas_personales);

--2.Quién(es) le debe más dinero a ud. y cuánto
SELECT nombre, me_debe
FROM finanzas_personales
WHERE me_debe = (SELECT MAX(me_debe) FROM finanzas_personales);

--3.Cuánto dinero debe en total
SELECT SUM(le_debo) 
  AS deuda_total
FROM finanzas_personales;

--4.Cuánto dinero debe en promedio
SELECT 
  ROUND(AVG(le_debo)) 
  AS promedio_deuda 
FROM finanzas_personales;

--5.Suponiendo que no puede pagar más de una cuota al mes. ¿Cuántos meses demoraría en saldar su deuda?
SELECT 
  SUM(cuotas_pagar) 
  AS meses_para_saldar
FROM finanzas_personales;

--6.Suponga que logar cobrar todo lo que le deben en un mismo día y decide usar todo eso para pagar lo que se pueda de su deuda
SELECT 
  (SUM(le_debo) - SUM(me_debe)) / SUM(cuotas_pagar) AS nueva_cuota_mensual
FROM finanzas_personales;

--7.Insertar un nuevo registro en la tabla.
insert into finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('pareja', 0, 0, 50000, 1);

--8.¿De cuánto será la cuota a pagar este mes?
SELECT
  SUM(le_debo / cuotas_pagar) AS cuota_total_este_mes
FROM finanzas_personales
WHERE cuotas_pagar > 0;

--9.Realizar el update en la tabla
UPDATE finanzas_personales
  SET
  cuotas_pagar = 13
WHERE nombre = 'almacén esquina';

--10.¿De cuánto será la cuota a pagar este mes?
SELECT 
  SUM(le_debo / cuotas_pagar) AS cuota_total_este_mes
FROM finanzas_personales
WHERE cuotas_pagar > 0;