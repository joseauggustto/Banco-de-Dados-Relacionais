CREATE DATABASE lab_db;

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    idade INT
);

INSERT INTO clientes (nome, email, idade) VALUES ('João Silva', 'joao.silva@gmail.com', 34);

INSERT INTO clientes (nome, email, idade) VALUES ('Maria Oliveira', 'maria.oliveira@gmail.com', 29);

SELECT * FROM clientes;

-- ######

