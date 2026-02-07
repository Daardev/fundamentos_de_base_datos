CREATE TABLE cliente (
  id_cliente SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE cuenta (
  id_cuenta SERIAL PRIMARY KEY,
  id_cliente INT NOT NULL,
  saldo NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (saldo >= 0),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE tipo_transaccion (
  id_tipo SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL
);

CREATE TABLE transaccion (
  id_transaccion SERIAL PRIMARY KEY,
  id_cuenta INT NOT NULL,
  id_tipo INT NOT NULL,
  monto NUMERIC(12,2) NOT NULL CHECK (monto > 0),
  fecha DATE NOT NULL,
  FOREIGN KEY (id_cuenta) REFERENCES cuenta(id_cuenta),
  FOREIGN KEY (id_tipo) REFERENCES tipo_transaccion(id_tipo)
);
