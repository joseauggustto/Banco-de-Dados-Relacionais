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

SELECT CURRENT_DATE AS 'Data Atual', CURRENT_TIME AS 'Hora Atual', CURRENT_TIMESTAMP AS 'Data e Hora atuais';

SELECT EXTRACT(DOW FROM CURRENT_DATE)::INT AS dia_da_semana, -- o ::INT deixa a saída em inteiro, pra ficar mais limpo.
       EXTRACT(DAY FROM CURRENT_DATE)::INT AS dia_atual,
       EXTRACT(DOY FROM CURRENT_DATE)::INT AS dia_do_ano,
       EXTRACT(MONTH FROM CURRENT_DATE)::INT AS mes_atual,
       EXTRACT(YEAR FROM CURRENT_DATE)::INT AS ano_atual,
       EXTRACT(CENTURY FROM CURRENT_DATE)::INT AS seculo_atual;

SELECT CASE EXTRACT(DOW FROM CURRENT_DATE)
            WHEN 0 THEN 'Domingo'
            WHEN 1 THEN 'Segunda-feira'
            WHEN 2 THEN 'Terça-feira'
            WHEN 3 THEN 'Quarta-feira'
            WHEN 4 THEN 'Quinta-feira'
            WHEN 5 THEN 'Sexta-feira'
            WHEN 6 THEN 'Sábado'
END AS 'Dia da semana';

SELECT to_char(CURRENT_DATE, 'TMDay') AS 'Dia da semana';

SELECT nome, dt_nascimento, AGE(dt_nascimento) AS "Idade em dias correntes", EXTRACT(YEAR FROM AGE(dt_nascimento))::INT AS "Idade aluno" FROM alunos;

SELECT 
    nome, 
    EXTRACT(YEAR FROM AGE(dt_nascimento))::INT AS "Idade",
    CASE 
        WHEN EXTRACT(YEAR FROM AGE(dt_nascimento)) <= 20 THEN '1. até 20 anos'
        WHEN EXTRACT(YEAR FROM AGE(dt_nascimento)) BETWEEN 21 AND 30 THEN '2. 21 a 30 anos'
        WHEN EXTRACT(YEAR FROM AGE(dt_nascimento)) BETWEEN 31 AND 40 THEN '3. 31 a 40 anos'
        WHEN EXTRACT(YEAR FROM AGE(dt_nascimento)) BETWEEN 41 AND 50 THEN '4. 41 a 50 anos'
        WHEN EXTRACT(YEAR FROM AGE(dt_nascimento)) BETWEEN 51 AND 60 THEN '5. 51 a 60 anos'
        WHEN EXTRACT(YEAR FROM AGE(dt_nascimento)) > 60 THEN '6. mais de 60 anos'
        ELSE 'Não informado'
    END AS "Faixa Etária" 
FROM alunos;
                
-- --------

