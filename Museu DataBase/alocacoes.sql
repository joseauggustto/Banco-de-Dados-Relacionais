CREATE TABLE alocacoes(
    hora_entrada TIME,
    hora_saida TIME,
    numero_sl INT REFERENCES salao(numero_sl),
    cpf VARCHAR(11) REFERENCES funcionarios(cpf),
    PRIMARY KEy (numero_sl, cpf)
);