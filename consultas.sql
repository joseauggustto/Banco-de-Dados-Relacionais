CREATE DATABASE escola;

\c escola;

-- --------

CREATE TABLE alunos(
    codigo_aluno SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(90) NOT NULL,
    sexo CHAR(1) NOT NULL,
    dt_nascimento DATE NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO alunos (nome, sexo, dt_nascimento, email) VALUES ('JOSÉ FRANCISCO TERRA','M','1989-10-28','JFT@GMAIL.COM');
INSERT INTO alunos (nome, sexo, dt_nascimento, email) VALUES ('ANDREY COSTA FILHO','M','1999-10-20','ANDREYCF@HOTMAIL.COM');
INSERT INTO alunos (nome, sexo, dt_nascimento, email) VALUES ('PATRÍCIA TORRES LOUREIRO','F','1980-10-20','PTORRES@GMAIL.COM');
INSERT INTO alunos (nome, sexo, dt_nascimento, email) VALUES ('CARLA MARIA MACIEL','F','1996-11-20',NULL);
INSERT INTO alunos (nome, sexo, dt_nascimento, email) VALUES ('LEILA SANTANA COSTA','F','2001-11-20',NULL);

SELECT * FROM alunos; -- Consulta total da tabela alunos

SELECT codigo_aluno, nome, sexo FROM alunos; -- Consulta parcial da tabela alunos

SELECT codigo_aluno AS 'Matrícula', nome AS 'Nome do Aluno', sexo AS 'Sexo' FROM alunos; 

SELECT codigo_alun

-- --------

