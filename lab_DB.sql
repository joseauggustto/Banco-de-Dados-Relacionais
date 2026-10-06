-- Criação do banco de dados lab_db

CREATE DATABASE lab_db;

\c lab_db;

-- Atividade 1 - Criação do banco de dados e tabela de clientes

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    idade INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

INSERT INTO clientes (nome, email, idade, data_criacao) VALUES ('João Silva', 'joao.silva@gmail.com', 34, NOW());

INSERT INTO clientes (nome, email, idade, data_criacao) VALUES ('Maria Oliveira', 'maria.oliveira@gmail.com', 29, NOW());

INSERT INTO clientes (nome, email, idade, data_criacao) VALUES ('João Silva', 'joao.silva@gmail.com', 34, NOW()) ON CONFLICT (email) DO NOTHING;

CREATE TABLE clientes_backup AS TABLE clientes WITH NO DATA; 

INSERT INTO clientes_backup SELECT * FROM clientes WHERE idade > 20; 

-- -----

ALTER TABLE clientes ADD endereco VARCHAR(200);

ALTER COLUMN idade SET NOT NULL;

ALTER TABLE clientes RENAME COLUMN endereco to endereco_residencial;

ALTER TABLE clientes DROP COLUMN endereco_residencial;

ALTER TABLE clientes ADD COLUMN idreg INT REFERENCES regiao(id);

-- -------
DROP TABLE clientes;
-- -------

SELECT * FROM clientes;



-- Atividade 2 - Criação da tabela pedidos 

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL (10, 2)
);

DROP TABLE pedidos;



-- Atividade 3 - Criação da tabela região 

CREATE TABLE regiao (
    id INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100)
);

DROP TABLE regiao;


-- Finaliza aqui, por enquanto. 

-- ######################## -- ########################



-- Data Base empresa 

CREATE DATABASE empresa;

\c empresa;

-- Atividade 1 - Criação da tabela departamento

CREATE TABLE departamento (
    id NUMERIC(7) PRIMARY KEY NOT NULL,
    nome VARCHAR(40) NOT NULL,
);

ALTER TABLE departamento ADD localizacao VARCHAR(40);
ALTER TABLE departamento ADD id_região NUMERIC(7) REFERENCES regiao2(id);


-- Atividade 2 - Criação da tabela empregado 


CREATE TABLE empregado ( 
    id NUMERIC(7) PRIMARY KEY NOT NULL,
    ult_nome VARCHAR(20) NOT NULL,
    prim_nome VARCHAR(20) NOT NULL,
    cargo VARCHAR(20),
    salario NUMERIC(7,2),
    dt_admissao DATE,
    cpf CHAR(11) UNIQUE,
    id_departamento NUMERIC(7) REFERENCES departamento(id),
    id_gerente NUMERIC(7) REFERENCES gerente(id)
);

-- Atividade 3 - Criação da tabela regiao

CREATE TABLE regiao2(
    id NUMERIC(7) PRIMARY KEY NOT NULL,
    nome VARCHAR(40)
);

DROP TABLE regiao2;
DROP TABLE departamento;
DROP TABLE empregado;

