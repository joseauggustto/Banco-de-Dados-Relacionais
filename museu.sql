CREATE DATABASE museu;

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
-- Dados de Funcionários, salões, obras e etc, poderão ser inseridos em um momento posterior.
-- Let's go!

SELECT * FROM autores; -- Listar todo o conteúdo da tabela autores. 

SELECT nome, nacionalidade FROM autores; -- Listar nome e nacionalidade de autores. 

SELECT cpf, nome, salario, salario * 12 FROM funcionarios; 

SELECT nome || ',' || nacionalidade AS "Nome e nacionalidade" FROM autores;

SELECT nome || ' ' || nacionalidade FROM autores; 

SELECT AVG(area) AS "Área média", COUNT(*) AS "Total salões" FROM saloes;

SELECT COUNT(*) AS "Total pinturas" FROM pinturas;

SELECT MAX(peso) AS "Maior peso" FROM esculturas;

SELECT MIN(titulo) FROM obras;

-- ------

-- Algumas consultas mais específicas. 

SELECT * FROM autores WHERE codigo > 105; 

SELECT * FROM autores WHERE codigo > 105 AND nacionalidade = 'francesa';

SELECT * FROM autores WHERE nacionalidade IN('francesa', 'brasileira'); 

SELECT * FROM autores WHERE codigo BETWEEN 104 AND 107;

SELECT * FROM autores WHERE nome LIKE '%Dali%';

SELECT * FROM saloes WHERE area IS NULL;

SELECT * FROM autores ORDER BY nacionalidade DESC;

SELECT * FROM autores ORDER BY nacionalidade ASC, codigo DESC;

SELECT * FROM autores ORDER BY 3 ASC, 1 DESC; -- Esse comando faz a mesma coisa do anterior. Mas, em vez de usar o nome, usa-se o index da coluna.

-- ---------

-- Mais algumas consultas. 

SELECT AVG(area) AS "Área média", COUNT(*) AS "Total Salões" FROM saloes;

SELECT estilo, COUNT(*) "Quantidade pinturas" FROM pinturas GROUP BY estilo;

SELECT estilo, COUNT(*) "Quantidade pinturas" FROM pinturas WHERE estilo<> 'cubista' GROUP BY estilo;

SELECT estilo, COUNT(*) "Quantidade pinturas" FROM pinturas WHERE estilo <> 'cubista' GROUP BY estilo HAVING COUNT(*) >=2;

SELECT DISTINCT estilo FROM pinturas;  

-- -------

-- Consultas unindo tabelas com INNER JOIN, muito legal!  

SELECT * FROM autores INNER JOIN obras ON autores.codigo = obras.autor;

SELECT o.codigo, o.titulo, a.nome FROM autores a INNER JOIN obras o ON a.codigo = o.autor WHERE ano BETWEEN 1965 AND 1975 AND salao = 36;

SELECT DISTINCT nome, nacionalidade FROM autores INNER JOIN obras ON autores.codigo = obras.autor;

SELECT a.codigo, o.titulo FROM autores a INNER JOIN obras o ON a.codigo = o.autor INNER JOIN saloes s ON s.numero_sl = o.salao WHERE a.nome = 'Pablo Picasso' AND s.andar = 3;

SELECT a.nome, a.nacionalidade, o.titulo, p.estilo FROM autores a INNER JOIN obras o ON a.codigo = o.autor INNER JOIN pinturas p ON p.codigo = o.codigo;

SELECT o.titulo, p.estilo FROM obras o INNER JOIN pinturas p USING(codigo);

SELECT o.titulo, p.estilo FROM obras o, pinturas p WHERE o.codigo = p.codigo;

-- ------

-- Agora consultas com junção a direita ou a esquerda.

SELECT a.nome, a.nacionalidade FROM autores a LEFT JOIN obras o ON a.codigo = o.autor WHERE o.codigo IS NULL; 

SELECT s.* FROM saloes s LEFT JOIN obras o ON s.numero_sl = o.salao WHERE o.salao IS NULL;

SELECT o.codigo, o.titulo FROM obras o LEFT JOIN esculturas e ON o.codigo = e.codigo LEFT JOIN pinturas p ON o.codigo = p.codigo WHERE e.material = 'Argila' OR p.estilo = 'Impressionista';

SELECT f.*, a.* FROM funcionarios f LEFT JOIN alocacoes a ON f.cpf = a.cpf;

-- A boa prática nesse caso é ligar as tabelas com LEFT JOIN, pois a leitura fica da consulta fica bem mais simplificada.
-- Usa-se o RIGHT JOIN em situações muito específicias. 

-- -----
-- Agora vamos para algumas consultas com subconsultas, let's!

SELECT * FROM funcionarios WHERE salario > (SELECT AVG(salario) FROM funcionarios); 

SELECT * FROM salao WHERE numero_sl IN(SELECT salao FROM obras);

SELECT * FROM salao WHERE numero_sl NOT IN(SELECT salao FROM obras WHERE numero_sl IS NOT NULL);

SELECT * FROM autores WHERE codigo NOT IN(SELECT autor FROM obras WHERE autor IS NOT NULL);

SELECT * FROM funcionarios WHERE cpf IN(SELECT cpf FROM alocacoes);

SELECT * FROM funcionarios WHERE cpf NOT IN(SELECT cpf FROM alocacoes);

-- ------
-- Agora algumas consultas mais complexas...

SELECT * FROM saloes s WHERE area > (SELECT AVG(area) FROM saloes i WHERE s.andar = i.andar);

SELECT * FROM autores a WHERE EXISTS(SELECT codigo FROM obras o WHERE o.autor = a.codigo);

