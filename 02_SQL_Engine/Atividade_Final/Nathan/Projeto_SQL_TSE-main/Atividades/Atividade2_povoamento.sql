USE SiriusTSE;
GO

-- Criação da tabela Temporária para importação
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Temporaria')
DROP TABLE dbo.Temporaria;
GO

CREATE TABLE Temporaria (
	DT_GERACAO DATE,
    HH_GERACAO TIME,
    ANO_ELEICAO INT,
    CD_TIPO_ELEICAO INT,
    NM_TIPO_ELEICAO VARCHAR(255),
    CD_ELEICAO INT,
    DS_ELEICAO VARCHAR(255),
    DT_ELEICAO DATE,
    SG_UF CHAR(2),
    SG_UE VARCHAR(10),
    NM_UE VARCHAR(255),
    SQ_CANDIDATO BIGINT,
    NR_ORDEM_BEM_CANDIDATO INT,
    CD_TIPO_BEM_CANDIDATO INT,
    DS_TIPO_BEM_CANDIDATO VARCHAR(255),
    DS_BEM_CANDIDATO VARCHAR(255),
    VR_BEM_CANDIDATO VARCHAR(255),
    DT_ULT_ATUAL_BEM_CANDIDATO DATE,
    HH_ULT_ATUAL_BEM_CANDIDATO TIME
    PRIMARY KEY (SQ_CANDIDATO, NR_ORDEM_BEM_CANDIDATO),
	CHECK (VR_BEM_CANDIDATO >= 0)
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

SET @caminhoArquivo = 'C:\Users\natha\Documents\MBA\SQL\bem\'

DECLARE cursor_arquivos CURSOR FOR
SELECT 'bem_candidato_2024_AC.csv' AS nomeArquivo
UNION ALL
SELECT 'bem_candidato_2024_AL.csv'
UNION ALL
SELECT 'bem_candidato_2024_AM.csv'
UNION ALL
SELECT 'bem_candidato_2024_AP.csv'
UNION ALL
SELECT 'bem_candidato_2024_BA.csv'
UNION ALL
SELECT 'bem_candidato_2024_CE.csv'
UNION ALL
SELECT 'bem_candidato_2024_ES.csv'
UNION ALL
SELECT 'bem_candidato_2024_GO.csv'
UNION ALL
SELECT 'bem_candidato_2024_MA.csv'
UNION ALL
SELECT 'bem_candidato_2024_MG.csv'
UNION ALL
SELECT 'bem_candidato_2024_MS.csv'
UNION ALL
SELECT 'bem_candidato_2024_MT.csv'
UNION ALL
SELECT 'bem_candidato_2024_PA.csv'
UNION ALL
SELECT 'bem_candidato_2024_PB.csv'
UNION ALL
SELECT 'bem_candidato_2024_PE.csv'
UNION ALL
SELECT 'bem_candidato_2024_PI.csv'
UNION ALL
SELECT 'bem_candidato_2024_PR.csv'
UNION ALL
SELECT 'bem_candidato_2024_RJ.csv'
UNION ALL
SELECT 'bem_candidato_2024_RN.csv'
UNION ALL
SELECT 'bem_candidato_2024_RO.csv'
UNION ALL
SELECT 'bem_candidato_2024_RS.csv'
UNION ALL
SELECT 'bem_candidato_2024_SC.csv'
UNION ALL
SELECT 'bem_candidato_2024_SE.csv'
UNION ALL
SELECT 'bem_candidato_2024_SP.csv'
UNION ALL
SELECT 'bem_candidato_2024_TO.csv'
UNION ALL
SELECT 'bem_candidato_2024_RR.csv';

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

INSERT INTO TIPO_BEM (CD_TIPO_BEM_CANDIDATO, DS_TIPO_BEM_CANDIDATO)
SELECT DISTINCT CD_TIPO_BEM_CANDIDATO, DS_TIPO_BEM_CANDIDATO
FROM Temporaria;

INSERT INTO BEM_CANDIDATO (	SQ_CANDIDATO, 
							NR_ORDEM_BEM_CANDIDATO, 
							CD_ELEICAO, 
							SG_UF, 
							SG_UE, 
							CD_TIPO_BEM_CANDIDATO, 
							DS_BEM_CANDIDATO, 
							VR_BEM_CANDIDATO, 
							DT_ULT_ATUAL_BEM_CANDIDATO, 
							HH_ULT_ATUAL_BEM_CANDIDATO
							)
SELECT DISTINCT SQ_CANDIDATO, 
				NR_ORDEM_BEM_CANDIDATO, 
				CD_ELEICAO, 
				SG_UF, 
				SG_UE, 
				CD_TIPO_BEM_CANDIDATO, 
				DS_BEM_CANDIDATO, 
				CAST(REPLACE(VR_BEM_CANDIDATO, ',', '.') AS DECIMAL(20, 2)) AS VR_BEM_CANDIDATO,
				DT_ULT_ATUAL_BEM_CANDIDATO, 
				HH_ULT_ATUAL_BEM_CANDIDATO
FROM Temporaria;

DROP TABLE Temporaria;

