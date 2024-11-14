/*
Created: 10/10/2024
Modified: 10/10/2024
Model: Microsoft SQL Server 2019
Database: MS SQL Server 2019
*/



-- Drop relationships section -------------------------------------------------

ALTER TABLE [TB_Estatistica] DROP CONSTRAINT [Relationship22]
go
ALTER TABLE [TB_Estatistica] DROP CONSTRAINT [Relationship21]
go
ALTER TABLE [TB_Estatistica] DROP CONSTRAINT [Relationship20]
go
ALTER TABLE [TB_Substituicao] DROP CONSTRAINT [Relationship19]
go
ALTER TABLE [TB_Substituicao] DROP CONSTRAINT [Relationship18]
go
ALTER TABLE [TB_Cartao] DROP CONSTRAINT [Relationship17]
go
ALTER TABLE [TB_Jogo] DROP CONSTRAINT [Relationship16]
go
ALTER TABLE [TB_Jogo] DROP CONSTRAINT [Relationship15]
go
ALTER TABLE [TB_Jogo] DROP CONSTRAINT [Relationship12]
go
ALTER TABLE [TB_Gol] DROP CONSTRAINT [Relationship11]
go
ALTER TABLE [TB_Substituicao] DROP CONSTRAINT [Relationship10]
go
ALTER TABLE [TB_Jogo] DROP CONSTRAINT [Relationship9]
go
ALTER TABLE [TB_Gol] DROP CONSTRAINT [Relationship8]
go
ALTER TABLE [TB_Escalacao] DROP CONSTRAINT [Relationship7]
go
ALTER TABLE [TB_Escalacao] DROP CONSTRAINT [Relationship6]
go
ALTER TABLE [SC_COPA].[TB_Jogador] DROP CONSTRAINT [REL_Selecao_Jogador]
go






-- Drop keys for tables section -------------------------------------------------

ALTER TABLE [SC_COPA].[TB_Selecao] DROP CONSTRAINT [PK_TB_Selecao]
go
ALTER TABLE [SC_COPA].[TB_Arbitragem] DROP CONSTRAINT [PK_TB_Arbitragem]
go
ALTER TABLE [SC_COPA].[TB_Jogador] DROP CONSTRAINT [PK_TB_Jogador]
go


-- Drop indexes section -------------------------------------------------

DROP INDEX [IX_REL_Selecao_Jogador] ON [SC_COPA].[TB_Jogador]
go


-- Drop tables section ---------------------------------------------------

DROP TABLE [SC_COPA].[TB_Selecao]
go
DROP TABLE [SC_COPA].[TB_Arbitragem]
go
DROP TABLE [SC_COPA].[TB_Jogador]
go

-- Drop schemas section --------------------------------------------------- 

DROP SCHEMA [SC_COPA]
go

-- Create schemas section -------------------------------------------------

CREATE SCHEMA [SC_COPA]
go

-- Create tables section -------------------------------------------------

-- Table SC_COPA.TB_Jogador

CREATE TABLE [SC_COPA].[TB_Jogador]
(
 [IdJogador] Smallint IDENTITY(1,1) NOT NULL,
 [IdSelecaoJogador] Smallint NULL,
 [NomJogador] Varchar(200) NOT NULL,
 [NumCamisa] Tinyint NOT NULL,
 [DscPosicao] Char(3) NOT NULL
        CONSTRAINT [CheckConstraintA2] CHECK (DscPosicao in ('GOL', 'ZAG', 'MEI','ATA')),
 [FlgAtivo] Char(1) DEFAULT 'A' NOT NULL
        CONSTRAINT [CheckConstraintA1] CHECK (FlgAtivo in ('A', 'I')),
 [DthCadastro] Datetime DEFAULT GETDATE() NOT NULL,
 [DthAlteracao] Datetime DEFAULT GETDATE() NOT NULL,
 [FlgCorteLesao] Char(1) DEFAULT N NOT NULL
)
go

EXEC sp_addextendedproperty 'MS_Description', 'Essa tabela será usada para armazenar todas as informações de jogadores.', 'SCHEMA', 'SC_COPA', 'TABLE', 'TB_Jogador', NULL, NULL
go
EXEC sp_addextendedproperty 'MS_Description', 'Coluna que identifica o código do jogador. Valor gerado de forma automática pelo SGBD.', 'SCHEMA', 'SC_COPA', 'TABLE', 'TB_Jogador', 'COLUMN', 'IdJogador'
go

-- Create indexes for table SC_COPA.TB_Jogador

CREATE INDEX [IX_REL_Selecao_Jogador] ON [SC_COPA].[TB_Jogador] ([IdSelecaoJogador])
go

-- Add keys for table SC_COPA.TB_Jogador

ALTER TABLE [SC_COPA].[TB_Jogador] ADD CONSTRAINT [PK_TB_Jogador] PRIMARY KEY ([IdJogador])
go

-- Table SC_COPA.TB_Arbitragem

CREATE TABLE [SC_COPA].[TB_Arbitragem]
(
 [IdArbitro] Smallint IDENTITY(1,1) NOT NULL,
 [NomArbitro] Varchar(200) NOT NULL,
 [DscFuncaoArbitro] Varchar(50) NOT NULL,
 [DscNacionalidade] Varchar(100) NOT NULL
)
go
EXEC sp_addextendedproperty 'MS_Description', 'Coluna que identifica o código do arbitro. Valor gerado de forma automática pelo SGBD.', 'SCHEMA', 'SC_COPA', 'TABLE', 'TB_Arbitragem', 'COLUMN', 'IdArbitro'
go
EXEC sp_addextendedproperty 'MS_Description', 'Coluna que identifica o nome do arbitro.', 'SCHEMA', 'SC_COPA', 'TABLE', 'TB_Arbitragem', 'COLUMN', 'NomArbitro'
go

-- Add keys for table SC_COPA.TB_Arbitragem

ALTER TABLE [SC_COPA].[TB_Arbitragem] ADD CONSTRAINT [PK_TB_Arbitragem] PRIMARY KEY ([IdArbitro])
go

-- Table SC_COPA.TB_Selecao

CREATE TABLE [SC_COPA].[TB_Selecao]
(
 [IdSelecao] Smallint IDENTITY(1,1) NOT NULL,
 [NomSelecao] Varchar(200) NOT NULL,
 [NomTreinador] Varchar(200) NOT NULL,
 [DscContinente] Varchar(50) NOT NULL
)
go

-- Add keys for table SC_COPA.TB_Selecao

ALTER TABLE [SC_COPA].[TB_Selecao] ADD CONSTRAINT [PK_TB_Selecao] PRIMARY KEY ([IdSelecao])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [SC_COPA].[TB_Jogador] ADD CONSTRAINT [REL_Selecao_Jogador] FOREIGN KEY ([IdSelecaoJogador]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Escalacao] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([IdJogador]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Escalacao] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([IdJogo]) REFERENCES [TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Gol] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([IdJogo]) REFERENCES [TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Jogo] ADD CONSTRAINT [Relationship9] FOREIGN KEY ([IdArbitro]) REFERENCES [SC_COPA].[TB_Arbitragem] ([IdArbitro]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Substituicao] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([IdJogo]) REFERENCES [TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Gol] ADD CONSTRAINT [Relationship11] FOREIGN KEY ([IdJogador]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Jogo] ADD CONSTRAINT [Relationship12] FOREIGN KEY ([IdEstadio]) REFERENCES [TB_Estadio] ([IdEstadio]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Jogo] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([IdSelecaoMandante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Jogo] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([IdSelecaoVisitante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Cartao] ADD CONSTRAINT [Relationship17] FOREIGN KEY ([IdJogador]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Substituicao] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([IdJogadorSubstituido]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Substituicao] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([IdJogadorSubstituto]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Estatistica] ADD CONSTRAINT [Relationship20] FOREIGN KEY ([IdJogo]) REFERENCES [TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Estatistica] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([IdSelecaoMandante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TB_Estatistica] ADD CONSTRAINT [Relationship22] FOREIGN KEY ([IdSelecaoVisitante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go






