
-- ENVÍOS - DDL

CREATE TABLE cliente (
  id_cliente SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(120) UNIQUE NOT NULL
);

CREATE TABLE sucursal (
  id_sucursal SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE encomienda (
  id_encomienda SERIAL PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_sucursal_origen INT NOT NULL,
  id_sucursal_destino INT NOT NULL,
  peso NUMERIC(6,2) NOT NULL CHECK (peso > 0),
  fecha_envio DATE NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_sucursal_origen) REFERENCES sucursal(id_sucursal),
  FOREIGN KEY (id_sucursal_destino) REFERENCES sucursal(id_sucursal)
);

CREATE TABLE historial_estado (
  id_historial SERIAL PRIMARY KEY,
  id_encomienda INT NOT NULL,
  estado VARCHAR(30) NOT NULL,
  fecha_estado DATE NOT NULL,
  FOREIGN KEY (id_encomienda) REFERENCES encomienda(id_encomienda)
);
