-- Criação de um banco de dados de uma empresa. 

CREATE DATABASE empresa;

\c empresa;

-- -------

CREATE TABLE regiao(
    id_regiao NUMERIC(7) PRIMARY KEY,
    nome VARCHAR(40)
);

CREATE TABLE departamento(
    id NUMERIC(7) PRIMARY KEY,
    nome VARCHAR(40),
    id_regiao NUMERIC(7) REFERENCES regiao(id_regiao) 
);

CREATE TABLE empregado(
    id NUMERIC(7) PRIMARY KEY,
    ult_nome VARCHAR(20),
    prim_nome VARCHAR(20),
    cargo VARCHAR(30),
    salario INT,
    dt_admissao DATE, 
    cpf CHAR(11) UNIQUE,
    id_depto NUMERIC(7) REFERENCES departamento(id)
);

CREATE TABLE cliente(
    id NUMERIC(7) PRIMARY KEY,
    nome VARCHAR(40),
    vendedor NUMERIC(7) REFERENCES empregado(id)
); 

-- ------

-- Início de algumas transações.

BEGIN; 

INSERT INTO regiao VALUES ( 1, 'Norte');
INSERT INTO regiao VALUES ( 2, 'Sul');

INSERT INTO departamento VALUES ( 10, 'Administrativo',1);
INSERT INTO departamento VALUES ( 20, 'Vendas',1);
INSERT INTO departamento VALUES ( 30, 'Compras',2);

COMMIT;

-- ------

SELECT id, nome FROM departamento; -- Para ver o id e nome de cada departamento. Necessário para ligar departamento a empregado. 

-- ------

BEGIN;
INSERT INTO empregado VALUES(1, 'Velasques', 'Carmen', 'Presidente', 29500, '2009-05-05', '34567890125', 10);  
INSERT INTO empregado VALUES(2, 'Neves', 'Lauro', 'Diretor de Compras', 19500, '2006-03-03', '23456789012', 30);  
INSERT INTO empregado VALUES(3, 'Nogueira', 'Ernane', 'Diretor de Vendas', 18000, '2000-04-05', '34567890123', 20);  
INSERT INTO empregado VALUES(4, 'Queiroz', 'Mark', 'Gerente de Compras', 8000, '2000-01-01', '12345432123', 30);
INSERT INTO empregado VALUES(5, 'Rodrigues', 'Alberto', 'Vendedor', 4000, '1990-08-05', '87965432123', 20);
INSERT INTO empregado VALUES(6, 'Ugarte', 'Marlene', 'Vendedor', 3500, '2004-03-19', '87654345678', 20);

INSERT INTO cliente VALUES ( 110, 'Ponto Quente', 4);
INSERT INTO cliente VALUES ( 120, 'Casa Supimpa', 3);
INSERT INTO cliente VALUES ( 130, 'Coisas e Tralhas', 6);
INSERT INTO cliente VALUES ( 140, 'Casa Desconto', 2);
COMMIT;

-- ------

-- Comandos solicitados pela atividade. 


SELECT * FROM empregado; 

SELECT id, prim_nome, ult_nome FROM empregado;

SELECT salario * 12 AS "salario Anual" FROM empregado;

SELECT prim_nome || " " || ult_nome FROM empregado;

SELECT prim_nome || " " || ult_nome AS "Nome completo" FROM empregado;

SELECT 9 + 5, NOW();

SELECT
    ROUND(AVG(salario), 2) AS "Média salarial",
    SUM(salario) AS "Total salario mensal",
    MAX(salario) AS "Maior salario",
    MIN(salario) AS "Menor salario"
FROM empregado;

SELECT
    MAX(id),
    MIN(id),
    MAX(ult_nome),
    MIN(ult_nome),
    MAX(dt_admissao),
    MIN(dt_admissao)
FROM empregado; 


-- ------

-- Vamos fazer mais algumas consultas...

SELECT * FROM empregado WHERE id > 3; 

SELECT id FROM cliente WHERE name='Ponto Quente';




