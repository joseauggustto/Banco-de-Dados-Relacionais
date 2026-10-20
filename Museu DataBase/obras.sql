CREATE TABLE obras(
    codigo INT PRIMARY KEY,
    titulo VARCHAR(50),
    ano INT,
    salao INT REFERENCES saloes(numero_sl),
    autor INT REFERENCES autores(codigo)
);