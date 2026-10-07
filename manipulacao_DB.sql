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

UPDATE clientes SET idade = 35 WHERE nome = 'João Silva'; 

UPDATE clientes SET idade = 26 WHERE nome = 'Maria Oliveira' RETURNING *;

UPDATE clientes SET idade = idade + 1 WHERE idade < 30; 

DELETE FROM clientes WHERE idade < 30; 

-- -----

ALTER TABLE clientes ADD endereco VARCHAR(200);

ALTER COLUMN idade SET NOT NULL;

ALTER TABLE clientes RENAME COLUMN endereco to endereco_residencial;

ALTER TABLE clientes DROP COLUMN endereco_residencial;

ALTER TABLE clientes ADD COLUMN idreg INT REFERENCES regiao(id);


-- -------
DROP TABLE clientes;
-- -------


-- #########################

CREATE TABLE labtrans(
    id INT,
    nome varchar(100),
);

BEGIN;
INSERT INTO labtrans (id, nome) VALUES (1, 'Transação 1');
INSERT INTO labtrans (id, nome) VALUES (2, 'Transação 2');
SELECT * FROM labtrans;
SAVE POINT savepointA;
INSERT INTO labtrans (id, nome) VALUES (3, 'Transação 3');
INSERT INTO labtrans (id, nome) VALUES (4, 'Transação 4');
SAVE POINT savepointB; 
UPDATE labtrans SET nome = 'Trans4' WHERE id = 4;
UPDATE labtrans SET nome = 'Trans2' WHERE id = 2;
SAVE POINT savepointC;
DELETE FROM labtrans WHERE id = 1;
DELETE FROM labtrans WHERE id = 2;
ROLLBACK TO savepointB;
SELECT * FROM labtrans;
ROLLBACK TO savepointA;

COMMIT; 

-- #########################


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

INSERT INTO regiao (id, nome) VALUES (3, 'Norte'); 

INSERT INTO regiao VALUES (2, 'Sul');

INSERT INTO regiao VALUES (1, 'Regiao 1');

-- -------
DROP TABLE regiao;
-- -------

-- #########################


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

INSERT INTO departamento (id, nome, id_regiao2) VALUES (10, 'Administrativo', 1), (20, 'Vendas', 1), (30, 'Compras', 2); 

DELETE FROM departamento WHERE id_regiao = 1;

-- #########################


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

UPDATE empregado SET salario = salario = 10000;

DELETE FROM empregado;
-- #########################


-- Atividade 3 - Criação da tabela regiao

CREATE TABLE regiao2(
    id NUMERIC(7) PRIMARY KEY NOT NULL,
    nome VARCHAR(40)
);

ALTER TABLE regiao2 RENAME COLUMN nome TO nome_regiao;

INSERT INTO regiao2 (id, nome) VALUES (1, 'Norte'); 

INSERT INTO regiao2 VALUES (2, 'Sul');

DELETE FROM regiao2;

-- -------
DROP TABLE regiao2;
DROP TABLE departamento;
DROP TABLE empregado;
-- -------

-- #########################

CREATE DATABASE bdtransacao;

\c bdtransacao;

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

CREATE TABLE vendas(
    id INT PRIMARY KEY NOT NULL,
    produto_id INT REFERENCES produtos(id),
    quantidade INT,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

BEGIN;
INSERT INTO produtos (nome, preco)  VALUES ('Produto A', 10.00), ('Produto B', 20.00);
SAVE POINT savepoint1;
INSERT INTO vendas (id, produto_id, quantidade) VALUES (1, 1, 2); 
ROLLBACK TO savepoint1;
COMMIT;


