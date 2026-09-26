CREATE DATABASE university;


CREATE TABLE student (
    id SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(60) NOT NULL,
    nascimento DATE NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address_ VARCHAR(100) NOT NULL
);

CREATE TABLE course(
    id_course SERIAL PRIMARY KEY NOT NULL,
    name_course VARCHAR(30) NOT NULL,
    description_course VARCHAR(120) NOT NULL,
    carga_horaria INTEGER NOT NULL
);

CREATE TABLE inscricao(
    id_inscricao SERIAL PRIMARY KEY NOT NULL,
    id_student INTEGER NOT NULL,
    id_course INTEGER NOT NULL,
    data_inscricao DATE DEFAULT CURRENT_DATE, 
    FOREIGN KEY (id_student) REFERENCES student(id),
    FOREIGN KEY (id_course) REFERENCES course(id_course)
);