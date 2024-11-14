------------------------------------------------------------------

CREATE SCHEMA gabriel
CREATE SCHEMA aline
CREATE SCHEMA daniela

------------------------------------------------------------------
SELECT GETDATE()
-- staging.tb_aluno - 27

CREATE TABLE staging.tb_aluno -- 1388
(
id_aluno int NOT NULL IDENTITY(1389,1) -- PK
,nome_aluno varchar(200) NOT NULL 
,sexo_aluno tinyint NOT NULL 	-- 4 valores (1 - a, 2 - b, 3 - c, 4 - d) 
,data_inclusao datetime NOT NULL DEFAULT GETDATE()
,status_aluno bit NULL DEFAULT 1
)

-- CRIAR A PK DE ALUNO

CREATE TABLE staging.tb_endereco
(
id_aluno  int NOT NULL 
,endereco_aluno varchar(200) NOT NULL 
)

CRIAR FK DE ENDERECO COM ALUNO

CREATE TABLE staging.tb_venda
(
id_venda  int NOT NULL 
,unidades smallint NOT NULL 
,valor_unitario decimal(23,2) NOT NULL 
,valor_vendido as (unidades * valor_unitario) PERSISTED 
)


INSERT INTO staging.tb_venda

SELECT * FROM staging.tb_venda

