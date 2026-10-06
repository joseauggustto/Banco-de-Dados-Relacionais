-- Criação do banco de dados lab_db

CREATE DATABASE lab_db;

\c lab_db;

-- Atividade 1 - Criação do banco de dados e tabela de clientes

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(100),
    email VARCHAR(100),
    idade INT,
    data_criacao TIMESTAMP
);

INSERT INTO clientes (nome, email, idade, data_criacao) VALUES ('João Silva', 'joao.silva@gmail.com', 34, NOW());

INSERT INTO clientes (nome, email, idade, data_criacao) VALUES ('Maria Oliveira', 'maria.oliveira@gmail.com', 29, NOW());

SELECT * FROM clientes;


-- ######

-- Atividade 2 - Criação da tabela pedidos 

CREATE TABLE pedidos (
    id INT PRIMARY KEY NOT NULL,
    cliente_id INT REFERENCES clientes(id),
    data_pedido TIMESTAMP,
    total DECIMAL (10, 2)
);

-- ######

-- Atividade 3 - Criação da tabela região 

CREATE TABLE regiao (
    id INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100)
);
