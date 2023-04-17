CREATE DATABASE BIBLIOTECA;

--Tabela livros
CREATE TABLE livros (
  id_livro int IDENTITY (1,1) PRIMARY KEY,
  autor VARCHAR(100),
  nome VARCHAR(100),
  ano_publicacao INT,
  CONSTRAINT check_ano CHECK (ano_publicacao >= 1600)
);

--Atributos da table Livros
INSERT INTO livros (autor, nome, ano_publicacao) VALUES ('George Orwell', '1984', 1949);
INSERT INTO livros (autor, nome, ano_publicacao) VALUES ('J.K. Rowling', 'Harry Potter e a Pedra Filosofal', 1997);

-- Inserir novo registro na tabela "livros"
INSERT INTO livros (autor, nome, ano_publicacao) VALUES ('J.R.R. Tolkien', 'O Senhor dos Anéis', 1954);

-- Atualizar registro na tabela "livros"
UPDATE livros SET autor = 'J.R.R. Tolkien', nome = 'O Hobbit' WHERE id_livro = 1;

-- Deletar registro na tabela "livros"
DELETE FROM livros WHERE id_livro = 2;

-- Selecionar todos os registros da tabela "livros"
SELECT * FROM livros;

-- Selecionar registros específicos da tabela "livros"
SELECT nome, autor FROM livros WHERE ano_publicacao > 2000;

--Tabela clientes
CREATE TABLE clientes (
  id_cliente INT IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT check_telefone CHECK (telefone LIKE '+55%'),
  CONSTRAINT fk_livros FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

--Atributos da table Clientes

-- Inserir novo registro na tabela "clientes"
INSERT INTO clientes (nome, email, endereco, telefone) VALUES ('João Silva', 'joao.silva@email.com', 'Rua das Flores, 123', '+5511999999999');

-- Atualizar registro na tabela "clientes"
UPDATE clientes SET endereco = 'Rua das Árvores, 456' WHERE id_cliente = 1;

-- Deletar registro na tabela "clientes"
DELETE FROM clientes WHERE id_cliente = 2;

-- Selecionar todos os registros da tabela "clientes"
SELECT * FROM clientes;

-- Selecionar registros específicos da tabela "clientes"
SELECT nome, email FROM clientes WHERE telefone LIKE '+5511%';


-- Procedure
CREATE PROCEDURE biblioteca_procedure()
BEGIN
    -- Inserir novo registro na tabela "livros"
    INSERT INTO livros (autor, nome, ano_publicacao) VALUES ('J.R.R. Tolkien', 'O Senhor dos Anéis', 1954);

    -- Atualizar registro na tabela "livros"
    UPDATE livros SET autor = 'J.R.R. Tolkien', nome = 'O Hobbit' WHERE id_livro = 1;

    -- Deletar registro na tabela "livros"
    DELETE FROM livros WHERE id_livro = 2;

    -- Selecionar todos os registros da tabela "livros"
    SELECT * FROM livros;

    -- Selecionar registros específicos da tabela "livros"
    SELECT nome, autor FROM livros WHERE ano_publicacao > 2000;

    -- Inserir novo registro na tabela "clientes"
    INSERT INTO clientes (nome, email, endereco, telefone) VALUES ('João Silva', 'joao.silva@email.com', 'Rua das Flores, 123', '+5511999999999');

    -- Atualizar registro na tabela "clientes"
    UPDATE clientes SET endereco = 'Rua das Árvores, 456' WHERE id_cliente = 1;

    -- Deletar registro na tabela "clientes"
    DELETE FROM clientes WHERE id_cliente = 2;

    -- Selecionar todos os registros da tabela "clientes"
    SELECT * FROM clientes;

    -- Selecionar registros específicos da tabela "clientes"
    SELECT nome, email FROM clientes WHERE telefone LIKE '+5511';
END;


