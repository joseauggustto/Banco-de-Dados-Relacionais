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
    dt_nascimento DATE, 
    cpf CHAR(11) UNIQUE,
    id_depto NUMERIC(7) REFERENCES departamento(id),
    id_gerente NUMERIC(7) REFERENCES gerente(id)
);

CREATE TABLE cliente(
    id NUMERIC(7) PRIMARY KEY,
    nome VARCHAR(40),
    vendedor NUMERIC(7) REFERENCES vendedor(id)
);

-- ------

-- Início de algumas transações.

BEGIN; 

INSERT INTO REGIAO VALUES ( 1, 'Norte');
INSERT INTO REGIAO VALUES ( 2, 'Sul');

INSERT INTO DEPARTAMENTO VALUES ( 10, 'Administrativo',1);
INSERT INTO DEPARTAMENTO VALUES ( 20, 'Vendas',1);
INSERT INTO DEPARTAMENTO VALUES ( 30, 'Compras',2);

INSERT INTO EMPREGADO VALUES( 1, 'Velasques', 'Carmen', 'Presidente',29500, '05/05/2009','34567890125',10);  -- Essas inserções em empregados foram fornecidas pelo professor. Elas não estão totalmente corretas.
INSERT INTO EMPREGADO VALUES( 2, 'Neves', 'Lauro', 'Diretor de Compras',19500, '03/03/2009','23456789012',30); -- Para fins educacionais, iremos simular que elas estão corretas. 
INSERT INTO EMPREGADO VALUES( 3, 'Nogueira', 'Ernane','Diretor de Vendas', 18000, '07/04/2010','34567890123',20); -- O maior erro é na data de nascimento, não segue o padrão internacional AAAA-MM-DD. 
INSERT INTO EMPREGADO VALUES( 4, 'Queiroz', 'Mark','Gerente de Compras',8000, '11/11/2010','12345432123',30);
INSERT INTO EMPREGADO VALUES( 5, 'Rodrigues', 'Alberto', 'Vendedor',4000, '10/10/2008', '87965432123', 20);
INSERT INTO EMPREGADO VALUES( 6, 'Ugarte', 'Marlene', 'Vendedor', 3500,'03/03/2009', '87654345678',20);

INSERT INTO CLIENTE VALUES ( 110, 'Ponto Quente',5);
INSERT INTO CLIENTE VALUES ( 120, 'Casa Supimpa',6);
INSERT INTO CLIENTE VALUES ( 130, 'Coisas e Tralhas',5);
INSERT INTO CLIENTE VALUES ( 140, 'Casa Desconto');

COMMIT; 