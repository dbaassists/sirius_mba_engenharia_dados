----------------------------------------------------------------------------------------------------------
-- Criando uma tabela de Estudantes e inserindo alguns registros

-- Cria��o da tabela Estudante
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudante')
DROP TABLE gabriel.Estudante
GO
CREATE TABLE gabriel.Estudante
(
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    pontuacao INT NOT NULL,
);

-- Inserir registros na tabela 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (1, 'Joana', 'Feminino', 20, 500);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (2, 'Jo�o', 'Masculino', 22, 545);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (3, 'Sara', 'Feminino', 25, 600);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (4, 'Laura', 'Feminino', 18, 400);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (5, 'Alan', 'Masculino', 20, 500); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (6, 'Kelly', 'Feminino', 22, 500);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (7, 'Ricardo', 'Masculino', 18, 643); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (8, 'Cl�vis', 'Masculino', 23, 543);
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (9, 'Gabriel', 'Masculino', 21, 499); 
INSERT INTO gabriel.Estudante (id, nome, sexo,idade,pontuacao) VALUES (10, 'Maria', 'Feminino', 27, 400);

----------------------------------------------------------------------------------------------------------
-- Alterando a estrutura da tabela "gabriel.Estudante" para transformar a coluna "id" para o tipo IDENTITY

-- Cria��o da tabela Estudante
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudante')
DROP TABLE gabriel.Estudante
GO
CREATE TABLE gabriel.Estudante
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    pontuacao INT NOT NULL,
);

-- Inserir registros na tabela 

INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Joana', 'Feminino', 20, 500);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Jo�o', 'Masculino', 22, 545);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Sara', 'Feminino', 25, 600);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Laura', 'Feminino', 18, 400);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Alan', 'Masculino', 20, 500); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Kelly', 'Feminino', 22, 500);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Ricardo', 'Masculino', 18, 643); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Cl�vis', 'Masculino', 23, 543);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Gabriel', 'Masculino', 21, 499); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Maria', 'Feminino', 27, 400);

----------------------------------------------------------------------------------------------------------
-- Alterando a estrutura da tabela "gabriel.Estudante" para incluir a coluna DthInclusao e definir esse coluna 
-- para ser uma coluna com valor DEFAULT

-- Cria��o da tabela Estudante
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudante')
DROP TABLE gabriel.Estudante
GO
CREATE TABLE gabriel.Estudante
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    pontuacao INT NOT NULL,
	DthInclusao DATETIME NOT NULL DEFAULT GETDATE()
);


-- Inserir registros na tabela 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Joana', 'Feminino', 20, 500);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Jo�o', 'Masculino', 22, 545);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Sara', 'Feminino', 25, 600);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Laura', 'Feminino', 18, 400);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Alan', 'Masculino', 20, 500); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Kelly', 'Feminino', 22, 500);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Ricardo', 'Masculino', 18, 643); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Cl�vis', 'Masculino', 23, 543);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Gabriel', 'Masculino', 21, 499); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Maria', 'Feminino', 27, 400);

SELECT * FROM gabriel.Estudante


-- Agora um outro exemplo
-- Por mais que a coluna "DthInclusao" tenha sido definida como uma coluna que possui um valor DEFAULT GETDATE()
-- voc� pode fornecer um valor para essa coluna
-- Quando definimos que uma coluna tem um valor DEFAULT, isso significa que ela ser� preenchida caso um valor
-- n�o seja informado. Vamos ver!


-- Cria��o da tabela Estudante
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudante')
DROP TABLE gabriel.Estudante
GO
CREATE TABLE gabriel.Estudante
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    pontuacao INT NOT NULL,
	DthInclusao DATETIME NOT NULL DEFAULT GETDATE()
);

-- Inserir registros na tabela 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao,DthInclusao) VALUES ('Joana', 'Feminino', 20, 500,GETDATE());
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao,DthInclusao) VALUES ('Jo�o', 'Masculino', 22, 545,GETDATE());
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Sara', 'Feminino', 25, 600);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Laura', 'Feminino', 18, 400);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Alan', 'Masculino', 20, 500); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao,DthInclusao) VALUES ('Kelly', 'Feminino', 22, 500,GETDATE());
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Ricardo', 'Masculino', 18, 643); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Cl�vis', 'Masculino', 23, 543);
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao) VALUES ('Gabriel', 'Masculino', 21, 499); 
INSERT INTO gabriel.Estudante (nome, sexo,idade,pontuacao,DthInclusao) VALUES ('Maria', 'Feminino', 27, 400,GETDATE());


SELECT * FROM gabriel.Estudante

--------------------------------------------------------------------------------------------------------------------

-- Vamos agora criar uma tabela e nomear ele de "gabriel.Estudantes_Masculinos" e inserir valores nela a partir da tabela "gabriel.Estudante"

-- Cria��o da tabela Estudantes_Masculinos
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudantes_Masculinos')
DROP TABLE gabriel.Estudantes_Masculinos
GO
CREATE TABLE gabriel.Estudantes_Masculinos
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    pontuacao INT NOT NULL,
	DthInclusao DATETIME NOT NULL DEFAULT GETDATE()
);


INSERT INTO gabriel.Estudantes_Masculinos (nome, sexo,idade,pontuacao,DthInclusao)
SELECT nome, sexo,idade,pontuacao,DthInclusao
FROM gabriel.Estudante
WHERE sexo = 'Masculino'

--------------------------------------------------------------------------------------------------------------------

-- Podemos tamb�m fazer de outra forma: 
-- Vamos agora criar uma tabela e nomear ele de "gabriel.Estudantes_Masculinos" e inserir valores nela a partir da tabela "gabriel.Estudante"

-- Verificar se a tabela "gabriel.Estudantes_Masculinos" existe
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudantes_Masculinos')
DROP TABLE gabriel.Estudantes_Masculinos
GO

SELECT nome, sexo, idade, pontuacao, DthInclusao
INTO gabriel.Estudantes_Masculinos
FROM gabriel.Estudante
WHERE sexo = 'Masculino'


IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estudantes_Masculinos')
DROP TABLE gabriel.Estudantes_Masculinos
GO

SELECT nome NmEstudante, sexo DsSexo, idade NumIdade, pontuacao NumPontuacao, DthInclusao DataInclusao
INTO gabriel.Estudantes_Masculinos
FROM gabriel.Estudante
WHERE sexo = 'Masculino'