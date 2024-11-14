-- Selecionando o Banco de Dados
USE DBDBAASSISTS
GO

-- Eliminar a tabela Estudante caso ela exista
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudante')
DROP TABLE gabriel.Estudante
GO

-- Criação da tabela Estudante
CREATE TABLE gabriel.Estudante
(
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    pontuacao INT NOT NULL,
)
GO

-- Inserir registros na tabela 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (1, 'Joana', 'Feminino', 20, 500);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (2, 'João', 'Masculino', 22, 545);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (3, 'Sara', 'Feminino', 25, 600);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (4, 'Laura', 'Feminino', 18, 400);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (5, 'Alan', 'Masculino', 20, 500); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (6, 'Kelly', 'Feminino', 22, 500);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (7, 'Ricardo', 'Masculino', 18, 643); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (8, 'Clóvis', 'Masculino', 23, 543);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (9, 'Gabriel', 'Masculino', 21, 499); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (10, 'Maria', 'Feminino', 27, 400);



-- Eliminar todos os registros
DELETE FROM gabriel.Estudante;

-- OU

-- Eliminar todos os registros
DELETE gabriel.Estudante;

SELECT* FROM gabriel.Estudante;

-----------------------------------------------------------------------------------------------------

-- Eliminar a tabela Estudante caso ela exista
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudante')
DROP TABLE gabriel.Estudante
GO

-- Criação da tabela Estudante
CREATE TABLE gabriel.Estudante
(
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    pontuacao INT NOT NULL,
)
GO

-- Inserir registros na tabela 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (1, 'Joana', 'Feminino', 20, 500);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (2, 'João', 'Masculino', 22, 545);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (3, 'Sara', 'Feminino', 25, 600);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (4, 'Laura', 'Feminino', 18, 400);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (5, 'Alan', 'Masculino', 20, 500); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (6, 'Kelly', 'Feminino', 22, 500);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (7, 'Ricardo', 'Masculino', 18, 643); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (8, 'Clóvis', 'Masculino', 23, 543);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (9, 'Gabriel', 'Masculino', 21, 499); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (10, 'Maria', 'Feminino', 27, 400);

-- BEGIN TRAN OU BEGIN TRANSACTION
-- ROLLBACK
-- COMMIT 

-- Eliminar todos os registros que possuem a palavra MASCULINO na coluna SEXO 
DELETE FROM gabriel.Estudante
WHERE sexo = 'Masculino';