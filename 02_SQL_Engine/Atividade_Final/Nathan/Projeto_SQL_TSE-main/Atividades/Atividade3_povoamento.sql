USE SiriusTSE;
GO

-- Criação da tabela Temporaria para importação
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Temporaria')
DROP TABLE dbo.Temporaria;
GO

CREATE TABLE Temporaria (
	DT_GERACAO DATE,
    HH_GERACAO TIME,
    AA_ELEICAO INT,
	SG_UF CHAR(2) NOT NULL,
    CD_TIPO_ELEICAO INT,
    NM_TIPO_ELEICAO VARCHAR(100),
    CD_ELEICAO INT NOT NULL,  
    DS_ELEICAO VARCHAR(100),
    SQ_CANDIDATO BIGINT NOT NULL,
    NR_ORDEM_REDE_SOCIAL VARCHAR(50) NOT NULL,
    DS_URL VARCHAR(500)
    PRIMARY KEY (SQ_CANDIDATO, NR_ORDEM_REDE_SOCIAL)
);
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DECLARE @nomeArquivo VARCHAR(255)
DECLARE @caminhoArquivo VARCHAR(255)
DECLARE @extensao VARCHAR(255)
DECLARE @comando VARCHAR(MAX)

SET @caminhoArquivo = 'C:\Users\natha\Documents\MBA\SQL\redesSociais\'

DECLARE cursor_arquivos CURSOR FOR
SELECT 'rede_social_candidato_2024_AC.csv' AS nomeArquivo
UNION ALL
SELECT 'rede_social_candidato_2024_AL.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_AM.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_AP.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_BA.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_CE.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_ES.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_GO.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_MA.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_MG.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_MS.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_MT.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_PA.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_PB.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_PE.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_PI.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_PR.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_RJ.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_RN.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_RO.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_RS.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_SC.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_SE.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_SP.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_TO.csv'
UNION ALL
SELECT 'rede_social_candidato_2024_RR.csv';

OPEN cursor_arquivos

FETCH NEXT FROM cursor_arquivos INTO @nomeArquivo

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @comando = '
    BULK INSERT Temporaria
    FROM ''' + @caminhoArquivo + @nomeArquivo +'''
    WITH (
        FORMAT = ''CSV'',
        FIELDQUOTE = ''"'', -- Se os campos estiverem entre aspas
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2, -- Ignora o cabeçalho, se houver
        FIELDTERMINATOR = '';'', -- Separador de campos
		CODEPAGE = ''1252'',
		TABLOCK
    );'

	PRINT ''
	PRINT 'Lendo o arquivo: ' + @nomeArquivo
    EXEC(@comando)
	
    FETCH NEXT FROM cursor_arquivos INTO @nomeArquivo
	
END

CLOSE cursor_arquivos
DEALLOCATE cursor_arquivos

-- Inserir dados nas tabelas finais

INSERT INTO REDE_SOCIAL(SG_UF, CD_ELEICAO, SQ_CANDIDATO, NR_ORDEM_REDE_SOCIAL, DS_URL)
SELECT DISTINCT SG_UF, CD_ELEICAO, SQ_CANDIDATO, NR_ORDEM_REDE_SOCIAL, DS_URL
from dbo.Temporaria
ORDER BY SQ_CANDIDATO, NR_ORDEM_REDE_SOCIAL

DROP TABLE Temporaria;
