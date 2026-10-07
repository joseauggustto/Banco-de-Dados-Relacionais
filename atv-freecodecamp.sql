- Tá meio bagunçado, mas é isso aí.


-- \l para listar as bases de dados

CREATE DATABASE nome_da_base; -- para criar uma nova base de dados

-- \c nome_da_base para conectar a base de dados

-- \d para listar as tabelas da base de dados

CREATE TABLE nome_da_tabela(); --- para criar uma nova tabela

-- \d tabela_nome_da_tabela = para listar as colunas da tabela

ALTER TABLE table_name ADD COLUMN column_name INTEGER; -- para adicionar uma nova coluna na tabela

ALTER TABLE second_table DROP COLUMN age; -- para remover uma coluna da tabela

ALTER TABLE second_table RENAME COLUMN name TO username; -- para renomear uma coluna da tabela

INSERT INTO second_table(id,username) VALUES(1, 'Samus'); -- para inserir dados na tabela

DELETE FROM second_table WHERE username='Luigi'; -- para deletar dados da tabela

DROP TABLE second_table; -- para deletar uma tabela

ALTER DATABASE first_database RENAME TO mario_database; -- para renomear uma base de dados

DROP DATABASE second_database; -- para deletar uma base de dados

-------

ALTER TABLE characters ADD COLUMN character_id SERIAL; -- para adicionar uma nova coluna com incremento automático na tabela

UPDATE characters SET favorite_color='Orange' WHERE name='Daisy'; -- para atualizar dados na tabela de acordo com uma condição

SELECT * FROM characters ORDER BY character_id; -- para selecionar todos os dados da tabela e ordenar pelo id do personagem

ALTER TABLE characters ADD PRIMARY KEY(name); -- para adicionar uma chave primária na tabela

ALTER TABLE characters DROP CONSTRAINT characters_pkey; -- para remover a chave primária da tabela

ALTER TABLE more_info ADD COLUMN weight NUMERIC(4, 1); -- para adicionar uma nova coluna com tipo numérico na tabela

ALTER TABLE more_info ADD COLUMN character_id INTEGER REFERENCES characters(character_id); -- para adicionar uma nova coluna com chave estrangeira na tabela

ALTER TABLE more_info ADD UNIQUE(character_id); -- para adicionar uma restrição de unicidade na coluna character_id da tabela

ALTER TABLE more_info ALTER COLUMN character_id SET NOT NULL; -- para adicionar uma restrição de não nulo na coluna character_id da tabela

ALTER TABLE sounds ADD COLUMN character_id INTEGER NOT NULL REFERENCES characters(character_id); -- o fluxo desse comando é: adicionar uma nova coluna character_id na tabela sounds, definir que essa coluna não pode ser nula e criar uma chave estrangeira que referencia a coluna character_id da tabela characters.

ALTER TABLE character_actions ADD FOREIGN KEY(character_id) REFERENCES characters(character_id); -- para adicionar uma chave estrangeira na tabela character_actions que referencia a coluna character_id da tabela characters

