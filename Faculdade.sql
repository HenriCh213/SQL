DROP DATABASE IF EXISTS Faculdade;
CREATE DATABASE Faculdade;
USE Faculdade;

CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL
);

CREATE TABLE Livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(50),
    id_autor INT,
    CONSTRAINT FOREIGN KEY (id_autor) REFERENCES Autor(id_autor) ON DELETE CASCADE
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    dataRetirada DATE NOT NULL,
    dataDevolucao DATE,
    id_usuario INT,
    id_livro INT,
    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_emprestimo_livro FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

INSERT INTO Autor (nome, nacionalidade) VALUES ('J.K. Rowling', 'Britânica'), ('Machado de Assis', 'Brasileira');
INSERT INTO Livro (titulo, genero, id_autor) VALUES ('Harry Potter e a Pedra Filosofal', 'Fantasia', 1), ('Dom Casmurro', 'Romance', 2);
INSERT INTO Usuario (nome, idade) VALUES ('Carlos Souza', 21), ('Ana Beatriz', 19);
INSERT INTO Emprestimo (dataRetirada, id_usuario, id_livro) VALUES (CURDATE(), 1, 1);