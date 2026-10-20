CREATE TABLE esculturas(
    material VARCHAR(30),
    peso NUMERIC(6, 2),
    altura NUMERIC(4, 1),
    codigo INT PRIMARY KEY REFERENCES obras(codigo)
);