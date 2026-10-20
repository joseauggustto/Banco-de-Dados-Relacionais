CREATE TABLE pinturas(
    estilo VARCHAR(30),
    area NUMERIC(5, 2),
    codigo INT PRIMARY KEY REFERENCES obras(codigo)
);