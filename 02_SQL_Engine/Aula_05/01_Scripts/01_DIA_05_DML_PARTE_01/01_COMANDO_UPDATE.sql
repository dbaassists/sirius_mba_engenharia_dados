-- Elimina Tabela Cliente
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Cliente')
DROP TABLE gabriel.Cliente;
GO
-- Criar Tabeal Cliente
CREATE TABLE gabriel.Cliente
(
CodigoCliente INT NOT NULL IDENTITY(1,1)
,NomeCliente VARCHAR(100) NOT NULL
,UF VARCHAR(2) NOT NULL
,ValorDesconto DECIMAL(23,2) NOT NULL
)
GO

-- Inserção de Dados na Tabela Cliente
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Zeca Pagodinho','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Romário','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Fred','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Gabi Gol','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Alok','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Daniel Alves','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Casagrande','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Pelé','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Neymar','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Alexandre Pires','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Hulk','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Victor','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Toninho Cerezo','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Jenival Lacerda','RS','2');

-- Consultar dados Tabela Cliente
SELECT * FROM gabriel.Cliente;


-- Método 01 - Atualização de todos os Clientes
UPDATE gabriel.Cliente
SET ValorDesconto = 2;

-- OR

-- Método 02 - Atualização de todos os Clientes
UPDATE Cliente
SET ValorDesconto = 2
FROM gabriel.Cliente Cliente;

-------------------------------------------------------------------------------------------------


-- Elimina Tabela Cliente
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Cliente')
DROP TABLE gabriel.Cliente;
GO
-- Criar Tabeal Cliente
CREATE TABLE gabriel.Cliente
(
CodigoCliente INT NOT NULL IDENTITY(1,1)
,NomeCliente VARCHAR(100) NOT NULL
,UF VARCHAR(2) NOT NULL
,ValorDesconto DECIMAL(23,2) NOT NULL
)
GO

-- Inserção de Dados na Tabela Cliente
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Zeca Pagodinho','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Romário','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Fred','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Gabi Gol','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Alok','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Daniel Alves','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Casagrande','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Pelé','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Neymar','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Alexandre Pires','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Hulk','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Victor','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Toninho Cerezo','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,UF,ValorDesconto) VALUES ('Jenival Lacerda','RS','2');

-- Consultar dados Tabela Cliente
SELECT * FROM gabriel.Cliente
WHERE UF = 'RJ';


-- Método 01 - Atualização Clientes do RJ
UPDATE gabriel.Cliente
SET ValorDesconto = 2
WHERE UF = 'RJ';

-- OR

-- Método 02 - Atualização Clientes do RJ
UPDATE Cliente
SET ValorDesconto = 2
FROM gabriel.Cliente Cliente
WHERE UF = 'RJ';


--------------------------------------------------------------------------------------------------------------
-- Vamos alterar a tabela "gabriel.Cliente" para incluir a coluna "NomeBairro"

-- Elimina Tabela Cliente
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Cliente')
DROP TABLE gabriel.Cliente;
GO
-- Criar Tabeal Cliente
CREATE TABLE gabriel.Cliente
(
CodigoCliente INT NOT NULL IDENTITY(1,1)
,NomeCliente VARCHAR(100) NOT NULL
,NomeBairro VARCHAR(100) NOT NULL
,UF VARCHAR(2) NOT NULL
,ValorDesconto DECIMAL(23,2) NOT NULL
)
GO

-- Inserção de Dados na Tabela Cliente
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Zeca Pagodinho','Xerém','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Romário','Barra','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Fred','Barra','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Gabi Gol','Barra','RJ','1.5');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Alok','Jardins','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Daniel Alves','Morumbi','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Casagrande','Jandins','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Pelé','Guarujá','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Neymar','Guarujá','SP','1.2');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Alexandre Pires','Belo Horizonte','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Hulk','Belo Horizonte','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Victor','Cotia','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Toninho Cerezo','Centro','MG','1.8');
INSERT INTO gabriel.Cliente (NomeCliente,NomeBairro,UF,ValorDesconto) VALUES ('Jenival Lacerda','Porto Alegre','RS','2');


-- Método 01 - Atualização Clientes do RJ que são moradores da Barra da Tijuca
UPDATE gabriel.Cliente
SET ValorDesconto = 2
WHERE UF = 'RJ'
AND NomeBairro  = 'Barra';

-- OR

-- Método 02 - Atualização Clientes do RJ que são moradores da Barra da Tijuca
UPDATE Cliente
SET ValorDesconto = 2
FROM gabriel.Cliente Cliente
WHERE UF = 'RJ'
AND NomeBairro  = 'Barra';