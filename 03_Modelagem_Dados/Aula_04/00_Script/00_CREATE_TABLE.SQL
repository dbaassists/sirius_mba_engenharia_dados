/*
Created: 10/10/2024
Modified: 10/10/2024
Model: Microsoft SQL Server 2019
Database: MS SQL Server 2019
*/


-- Drop relationships section -------------------------------------------------

ALTER TABLE [SC_COPA].[TB_Estatistica] DROP CONSTRAINT [Relationship22]
go
ALTER TABLE [SC_COPA].[TB_Estatistica] DROP CONSTRAINT [Relationship21]
go
ALTER TABLE [SC_COPA].[TB_Estatistica] DROP CONSTRAINT [Relationship20]
go
ALTER TABLE [SC_COPA].[TB_Substituicao] DROP CONSTRAINT [Relationship19]
go
ALTER TABLE [SC_COPA].[TB_Substituicao] DROP CONSTRAINT [Relationship18]
go
ALTER TABLE [SC_COPA].[TB_Cartao] DROP CONSTRAINT [Relationship17]
go
ALTER TABLE [SC_COPA].[TB_Jogo] DROP CONSTRAINT [Relationship16]
go
ALTER TABLE [SC_COPA].[TB_Jogo] DROP CONSTRAINT [Relationship15]
go
ALTER TABLE [SC_COPA].[TB_Jogo] DROP CONSTRAINT [Relationship12]
go
ALTER TABLE [SC_COPA].[TB_Gol] DROP CONSTRAINT [Relationship11]
go
ALTER TABLE [SC_COPA].[TB_Substituicao] DROP CONSTRAINT [Relationship10]
go
ALTER TABLE [SC_COPA].[TB_Jogo] DROP CONSTRAINT [Relationship9]
go
ALTER TABLE [SC_COPA].[TB_Gol] DROP CONSTRAINT [Relationship8]
go
ALTER TABLE [SC_COPA].[TB_Escalacao] DROP CONSTRAINT [Relationship7]
go
ALTER TABLE [SC_COPA].[TB_Escalacao] DROP CONSTRAINT [Relationship6]
go
ALTER TABLE [SC_COPA].[TB_Jogador] DROP CONSTRAINT [REL_Selecao_Jogador]
go






-- Drop keys for tables section -------------------------------------------------

ALTER TABLE [SC_COPA].[TB_Estatistica] DROP CONSTRAINT [PK_TB_Estatistica]
go
ALTER TABLE [SC_COPA].[TB_Escalacao] DROP CONSTRAINT [PK_TB_Escalacao]
go
ALTER TABLE [SC_COPA].[TB_Cartao] DROP CONSTRAINT [PK_TB_Cartao]
go
ALTER TABLE [SC_COPA].[TB_Substituicao] DROP CONSTRAINT [PK_TB_Substituicao]
go
ALTER TABLE [SC_COPA].[TB_Gol] DROP CONSTRAINT [PK_TB_Gol]
go
ALTER TABLE [SC_COPA].[TB_Jogo] DROP CONSTRAINT [PK_TB_Jogo]
go
ALTER TABLE [SC_COPA].[TB_Estadio] DROP CONSTRAINT [PK_TB_Estadio]
go
ALTER TABLE [SC_COPA].[TB_Selecao] DROP CONSTRAINT [PK_TB_Selecao]
go
ALTER TABLE [SC_COPA].[TB_Arbitragem] DROP CONSTRAINT [PK_TB_Arbitragem]
go
ALTER TABLE [SC_COPA].[TB_Jogador] DROP CONSTRAINT [PK_TB_Jogador]
go


-- Drop indexes section -------------------------------------------------

DROP INDEX [IX_Relationship6] ON [SC_COPA].[TB_Escalacao]
go
DROP INDEX [IX_Relationship7] ON [SC_COPA].[TB_Escalacao]
go
DROP INDEX [IX_Relationship17] ON [SC_COPA].[TB_Cartao]
go
DROP INDEX [IX_Relationship10] ON [SC_COPA].[TB_Substituicao]
go
DROP INDEX [IX_Relationship18] ON [SC_COPA].[TB_Substituicao]
go
DROP INDEX [IX_Relationship19] ON [SC_COPA].[TB_Substituicao]
go
DROP INDEX [IX_Relationship8] ON [SC_COPA].[TB_Gol]
go
DROP INDEX [IX_Relationship11] ON [SC_COPA].[TB_Gol]
go
DROP INDEX [IX_Relationship9] ON [SC_COPA].[TB_Jogo]
go
DROP INDEX [IX_Relationship12] ON [SC_COPA].[TB_Jogo]
go
DROP INDEX [IX_Relationship15] ON [SC_COPA].[TB_Jogo]
go
DROP INDEX [IX_Relationship16] ON [SC_COPA].[TB_Jogo]
go
DROP INDEX [IX_REL_Selecao_Jogador] ON [SC_COPA].[TB_Jogador]
go


-- Drop tables section ---------------------------------------------------

DROP TABLE [SC_COPA].[TB_Estatistica]
go
DROP TABLE [SC_COPA].[TB_Escalacao]
go
DROP TABLE [SC_COPA].[TB_Cartao]
go
DROP TABLE [SC_COPA].[TB_Substituicao]
go
DROP TABLE [SC_COPA].[TB_Gol]
go
DROP TABLE [SC_COPA].[TB_Jogo]
go
DROP TABLE [SC_COPA].[TB_Estadio]
go
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

-- Table SC_COPA.TB_Estadio

CREATE TABLE [SC_COPA].[TB_Estadio]
(
 [IdEstadio] Smallint IDENTITY(1,1) NOT NULL,
 [NomEstadio] Varchar(200) NOT NULL,
 [NumCapacidade] Int NOT NULL
)
go

-- Add keys for table SC_COPA.TB_Estadio

ALTER TABLE [SC_COPA].[TB_Estadio] ADD CONSTRAINT [PK_TB_Estadio] PRIMARY KEY ([IdEstadio])
go

-- Table SC_COPA.TB_Jogo

CREATE TABLE [SC_COPA].[TB_Jogo]
(
 [IdJogo] Smallint IDENTITY(1,1) NOT NULL,
 [IdSelecaoMandante] Smallint NULL,
 [IdSelecaoVisitante] Smallint NULL,
 [IdArbitro] Smallint NULL,
 [IdEstadio] Smallint NULL,
 [DscHorario] Datetime NOT NULL,
 [NomFase] Varchar(200) NOT NULL,
 [NumPlacarMandante] Tinyint NOT NULL,
 [NumPlacarVisitante] Tinyint NOT NULL,
 [NumPublicoPresente] Int NULL,
 [NumPercentualOcupacao] Decimal(18,2) NULL,
 [DscStatusPartida] Char(1) NULL,
 [NumPenaltiConvertido] Tinyint NULL,
 [NumPenaltiPerdido] Tinyint NULL
)
go

-- Create indexes for table SC_COPA.TB_Jogo

CREATE INDEX [IX_Relationship9] ON [SC_COPA].[TB_Jogo] ([IdArbitro])
go

CREATE INDEX [IX_Relationship12] ON [SC_COPA].[TB_Jogo] ([IdEstadio])
go

CREATE INDEX [IX_Relationship15] ON [SC_COPA].[TB_Jogo] ([IdSelecaoMandante])
go

CREATE INDEX [IX_Relationship16] ON [SC_COPA].[TB_Jogo] ([IdSelecaoVisitante])
go

-- Add keys for table SC_COPA.TB_Jogo

ALTER TABLE [SC_COPA].[TB_Jogo] ADD CONSTRAINT [PK_TB_Jogo] PRIMARY KEY ([IdJogo])
go

-- Table SC_COPA.TB_Gol

CREATE TABLE [SC_COPA].[TB_Gol]
(
 [IdGol] Smallint IDENTITY(1,1) NOT NULL,
 [IdJogo] Smallint NULL,
 [IdJogador] Smallint NULL,
 [NumTempoPartida] Tinyint NOT NULL,
 [NumMinutoGol] Char(1) NOT NULL,
 [DscFormaGol] Char(1) NOT NULL,
 [FlgPenalti] Char(1) NOT NULL,
 [FlgPenaltiPerdido] Char(1) NULL
)
go

-- Create indexes for table SC_COPA.TB_Gol

CREATE INDEX [IX_Relationship8] ON [SC_COPA].[TB_Gol] ([IdJogo])
go

CREATE INDEX [IX_Relationship11] ON [SC_COPA].[TB_Gol] ([IdJogador])
go

-- Add keys for table SC_COPA.TB_Gol

ALTER TABLE [SC_COPA].[TB_Gol] ADD CONSTRAINT [PK_TB_Gol] PRIMARY KEY ([IdGol])
go

-- Table SC_COPA.TB_Substituicao

CREATE TABLE [SC_COPA].[TB_Substituicao]
(
 [IdSubstituicao] Smallint IDENTITY(1,1) NOT NULL,
 [IdJogo] Smallint NULL,
 [IdJogadorSubstituido] Smallint NULL,
 [IdJogadorSubstituto] Smallint NULL,
 [NumMinutoPartida] Smallint NULL,
 [FlgSubstituicaoLesao] Char(1) NOT NULL,
 [NumTempoPartida] Tinyint NULL
)
go

-- Create indexes for table SC_COPA.TB_Substituicao

CREATE INDEX [IX_Relationship10] ON [SC_COPA].[TB_Substituicao] ([IdJogo])
go

CREATE INDEX [IX_Relationship18] ON [SC_COPA].[TB_Substituicao] ([IdJogadorSubstituido])
go

CREATE INDEX [IX_Relationship19] ON [SC_COPA].[TB_Substituicao] ([IdJogadorSubstituto])
go

-- Add keys for table SC_COPA.TB_Substituicao

ALTER TABLE [SC_COPA].[TB_Substituicao] ADD CONSTRAINT [PK_TB_Substituicao] PRIMARY KEY ([IdSubstituicao])
go

-- Table SC_COPA.TB_Cartao

CREATE TABLE [SC_COPA].[TB_Cartao]
(
 [IdCartao] Smallint IDENTITY(1,1) NOT NULL,
 [IdJogador] Smallint NULL,
 [TpoCartao] Char(1) NOT NULL,
 [NumTempoPartida] Tinyint NOT NULL,
 [NumMinutoCartao] Tinyint NOT NULL
)
go

-- Create indexes for table SC_COPA.TB_Cartao

CREATE INDEX [IX_Relationship17] ON [SC_COPA].[TB_Cartao] ([IdJogador])
go

-- Add keys for table SC_COPA.TB_Cartao

ALTER TABLE [SC_COPA].[TB_Cartao] ADD CONSTRAINT [PK_TB_Cartao] PRIMARY KEY ([IdCartao])
go

-- Table SC_COPA.TB_Escalacao

CREATE TABLE [SC_COPA].[TB_Escalacao]
(
 [IdEscalacao] Smallint IDENTITY(1,1) NOT NULL,
 [IdJogo] Smallint NULL,
 [IdJogador] Smallint NULL
)
go

-- Create indexes for table SC_COPA.TB_Escalacao

CREATE INDEX [IX_Relationship6] ON [SC_COPA].[TB_Escalacao] ([IdJogador])
go

CREATE INDEX [IX_Relationship7] ON [SC_COPA].[TB_Escalacao] ([IdJogo])
go

-- Add keys for table SC_COPA.TB_Escalacao

ALTER TABLE [SC_COPA].[TB_Escalacao] ADD CONSTRAINT [PK_TB_Escalacao] PRIMARY KEY ([IdEscalacao])
go

-- Table SC_COPA.TB_Estatistica

CREATE TABLE [SC_COPA].[TB_Estatistica]
(
 [IdJogo] Smallint NOT NULL,
 [IdSelecaoMandante] Smallint NOT NULL,
 [IdSelecaoVisitante] Smallint NOT NULL,
 [NumFinalzacaoGol] Tinyint NOT NULL,
 [NumFinalzacaoFora] Tinyint NOT NULL,
 [NumFinalzacaoTrave] Tinyint NOT NULL,
 [NumFinalzacaoBloqueada] Tinyint NOT NULL,
 [NumPenalti] Tinyint NOT NULL,
 [NumImpedimento] Tinyint NOT NULL,
 [NumDefesa] Tinyint NOT NULL,
 [NumDesarme] Tinyint NOT NULL,
 [NumFaltaSofrida] Tinyint NOT NULL,
 [NumFaltaCometida] Tinyint NOT NULL
)
go

-- Add keys for table SC_COPA.TB_Estatistica

ALTER TABLE [SC_COPA].[TB_Estatistica] ADD CONSTRAINT [PK_TB_Estatistica] PRIMARY KEY ([IdJogo],[IdSelecaoMandante],[IdSelecaoVisitante])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [SC_COPA].[TB_Jogador] ADD CONSTRAINT [REL_Selecao_Jogador] FOREIGN KEY ([IdSelecaoJogador]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Escalacao] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([IdJogador]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Escalacao] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([IdJogo]) REFERENCES [SC_COPA].[TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Gol] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([IdJogo]) REFERENCES [SC_COPA].[TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Jogo] ADD CONSTRAINT [Relationship9] FOREIGN KEY ([IdArbitro]) REFERENCES [SC_COPA].[TB_Arbitragem] ([IdArbitro]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Substituicao] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([IdJogo]) REFERENCES [SC_COPA].[TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Gol] ADD CONSTRAINT [Relationship11] FOREIGN KEY ([IdJogador]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Jogo] ADD CONSTRAINT [Relationship12] FOREIGN KEY ([IdEstadio]) REFERENCES [SC_COPA].[TB_Estadio] ([IdEstadio]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Jogo] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([IdSelecaoMandante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Jogo] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([IdSelecaoVisitante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Cartao] ADD CONSTRAINT [Relationship17] FOREIGN KEY ([IdJogador]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Substituicao] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([IdJogadorSubstituido]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Substituicao] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([IdJogadorSubstituto]) REFERENCES [SC_COPA].[TB_Jogador] ([IdJogador]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Estatistica] ADD CONSTRAINT [Relationship20] FOREIGN KEY ([IdJogo]) REFERENCES [SC_COPA].[TB_Jogo] ([IdJogo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Estatistica] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([IdSelecaoMandante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SC_COPA].[TB_Estatistica] ADD CONSTRAINT [Relationship22] FOREIGN KEY ([IdSelecaoVisitante]) REFERENCES [SC_COPA].[TB_Selecao] ([IdSelecao]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




