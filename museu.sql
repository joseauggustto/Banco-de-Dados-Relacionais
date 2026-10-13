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
    salario INT,
    cpf VARCHAR(11) PRIMARY KEY
);

CREATE TABLE saloes(
    area NUMERIC(5, 2),
    andar INT,
    numero_sl INT PRIMARY KEY
);

CREATE TABLE alocacoes(
    hora_entrada VARCHAR(5),
    hora_saida VARCHAR(5),
    numero_sl INT REFERENCES saloes(numero_sl),
    cpf VARCHAR(11) REFERENCES funcionarios(cpf)
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
    codigo INT REFERENCES obras(codigo)
);

CREATE TABLE esculturas(
    material VARCHAR(30),
    peso NUMERIC(4, 2),
    altura NUMERIC(4, 1),
    codigo INT REFERENCES obras(codigo)
);