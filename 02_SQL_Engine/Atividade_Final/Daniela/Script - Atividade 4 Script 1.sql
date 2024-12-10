-- 2 - Partido (Mesma tabela criada na Atividade 01) 
-- Já criada em Script - Atividade 1 Script 1.sql

-- 4 - UF
-- Já criada em Script - Atividade 1 Script 1.sql

-- 5 - Eleição
-- Já criada em Script - Atividade 1 Script 1.sql

-- 3 - Situação Turno
-- Já criada em Script - Atividade 1 Script 1.sql

-- Extra - Município
CREATE TABLE [Municipio] (
  [CD_MUNICIPIO] int NOT NULL,
  [NM_MUNICIPIO] varchar(250) NULL,
  PRIMARY KEY CLUSTERED ([CD_MUNICIPIO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

-- 1 - Votação;
CREATE TABLE [Votacao] (
  [SQ_CANDIDATO] char(12) NOT NULL,
  [CD_ELEICAO] smallint NOT NULL,
  [CD_MUNICIPIO] int NOT NULL,
  [NR_ZONA] smallint NOT NULL,
  [ST_VOTO_EM_TRANSITO] char(1) NULL,
  [QT_VOTOS_NOMINAIS] int NULL,
  [NM_TIPO_DESTINACAO_VOTOS] varchar(20) NULL,
  [QT_VOTOS_NOMINAIS_VALIDOS] int NULL,
  PRIMARY KEY CLUSTERED ([CD_ELEICAO], [SQ_CANDIDATO], [CD_MUNICIPIO], [NR_ZONA])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [dbo].[Votacao] ADD CONSTRAINT [FK_VOTACAO_MUNICIPIO] FOREIGN KEY ([CD_MUNICIPIO]) REFERENCES [dbo].[Municipio] ([CD_MUNICIPIO])
GO
ALTER TABLE [dbo].[Votacao] ADD CONSTRAINT [FK_VOTACAO_CANDIDATO] FOREIGN KEY ([SQ_CANDIDATO], [CD_ELEICAO]) REFERENCES [dbo].[Candidato] ([SQ_CANDIDATO], [CD_ELEICAO])
GO