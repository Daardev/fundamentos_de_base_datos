DROP TABLE IF EXISTS pacientes_covid;
CREATE TABLE pacientes_covid
(
    rut character varying(12) NOT NULL,
    nombre character varying(50),
    edad integer,
    dias_enfermo integer,
    fase integer,
    hospital character varying(255),
    PRIMARY KEY (rut)
);
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('10-1', 'Pedro', 25, 10, 1, 'JJAguirre');
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('12-2', 'Mario', 33, 15, 2, 'JJAguirre');
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('13-3', 'Diego', 45, 22, 3, 'SanJose');
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('14-4', 'Paula', 28, 18, 3, 'SanJose');
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('15-5', 'Mariela', 32, 21, 3, 'Salvador');
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('16-K', 'Patricia', 37, 2, 1, 'SanJuan');
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('17-7', 'Camila', 23, 12, 2, 'SanJuan');
insert into pacientes_covid (rut, nombre, edad, dias_enfermo, fase, hospital) values ('18-8', 'Javiera', 31, 15, 2, 'SanJuan');

select * from pacientes_covid;
