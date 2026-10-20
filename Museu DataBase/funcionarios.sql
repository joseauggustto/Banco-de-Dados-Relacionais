CREATE TABLE funcionarios(
    turno VARCHAR(1) REFERENCES turnos(cod_turno),
    funcao VARCHAR(20),
    nome VARCHAR(50),
    salario NUMERIC(10, 2),
    cpf CHAR(11) PRIMARY KEY
);