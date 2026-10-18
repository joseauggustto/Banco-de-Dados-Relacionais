CREATE DATABASE museu;

\c museu;

-- ------

CREATE TABLE turnos(
    cod_turno VARCHAR(1) PRIMARY KEY,
    nome_turno VARCHAR(5)
);

CREATE TABLE funcionarios(
    turno VARCHAR(1) REFERENCES turnos(cod_turno),
    funcao VARCHAR(20),
    nome VARCHAR(50),
    salario NUMERIC(10, 2),
    cpf CHAR(11) PRIMARY KEY
);

CREATE TABLE saloes(
    area NUMERIC(8, 2),
    andar INT,
    numero_sl INT PRIMARY KEY
);

CREATE TABLE alocacoes(
    hora_entrada TIME,
    hora_saida TIME,
    numero_sl INT REFERENCES salao(numero_sl),
    cpf VARCHAR(11) REFERENCES funcionarios(cpf),
    PRIMARY KEy (numero_sl, cpf)
);

-- ------

CREATE TABLE autores(
    codigo INT PRIMARY KEY,
    nome VARCHAR(50),
    nacionalidade VARCHAR(30)
);

CREATE TABLE obras(
    codigo INT PRIMARY KEY,
    titulo VARCHAR(50),
    ano INT,
    salao INT REFERENCES saloes(numero_sl),
    autor INT REFERENCES autores(codigo)
);

CREATE TABLE pinturas(
    estilo VARCHAR(30),
    area NUMERIC(5, 2),
    codigo INT PRIMARY KEY REFERENCES obras(codigo)
);

CREATE TABLE esculturas(
    material VARCHAR(30),
    peso NUMERIC(6, 2),
    altura NUMERIC(4, 1),
    codigo INT PRIMARY KEY REFERENCES obras(codigo)
);

-- -------

-- Nessa parte do código deveria haver alguns INSERT's. Entretanto, para questões de poupar tempo, iremos simular que temos alguns dados.
-- Dados de Funcionários, salões, obras e etc, poderão ocorrer em um momento posterior.
-- Let's go!

SELECT * FROM autores; -- Listar todo o conteúdo da tabela autores. 

SELECT nome, nacionalidade FROM autores; -- Listar nome e nacionalidade de autores. 

SELECT cpf, nome, salario, salario * 12 FROM autores; 

SELECT nome || "," || nacionalidade AS "Nome e nacionalidade" FROM autores;

SELECT nome || " " || nacionalidade FROM autores; 

SELECT AVG(area) AS "Área média", COUNT(*) saloes AS "Total salões" FROM saloes;

SELECT COUNT(*) pinturas AS "Total pinturas" FROM pinturas;

SELECT MAX(peso) AS "Maior peso" FROM esculturas;

SELECT MIN(titulo) FROM obras;



