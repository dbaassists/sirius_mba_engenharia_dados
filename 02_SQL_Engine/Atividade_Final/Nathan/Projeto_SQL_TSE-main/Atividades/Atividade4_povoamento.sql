USE SiriusTSE;
GO

-- Criação da tabela Temporaria para importação
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Temporaria')
DROP TABLE dbo.Temporaria;
GO

CREATE TABLE Temporaria (
    DT_GERACAO DATE,
    HH_GERACAO TIME,
    ANO_ELEICAO INT,
    CD_TIPO_ELEICAO INT,
    NM_TIPO_ELEICAO VARCHAR(255),
    NR_TURNO INT,
    CD_ELEICAO INT,
    DS_ELEICAO VARCHAR(255),
    DT_ELEICAO DATE,
    TP_ABRANGENCIA VARCHAR(50),
    SG_UF CHAR(2),
    SG_UE VARCHAR(50),
    NM_UE VARCHAR(255),
    CD_MUNICIPIO INT,
    NM_MUNICIPIO VARCHAR(255),
    NR_ZONA INT,
    CD_CARGO INT,
    DS_CARGO VARCHAR(255),
    SQ_CANDIDATO BIGINT,
    NR_CANDIDATO INT,
    NM_CANDIDATO VARCHAR(255),
    NM_URNA_CANDIDATO VARCHAR(255),
    NM_SOCIAL_CANDIDATO VARCHAR(255),
    CD_SITUACAO_CANDIDATURA INT,
    DS_SITUACAO_CANDIDATURA VARCHAR(255),
    CD_DETALHE_SITUACAO_CAND INT,
    DS_DETALHE_SITUACAO_CAND VARCHAR(255),
    CD_SITUACAO_JULGAMENTO INT,
    DS_SITUACAO_JULGAMENTO VARCHAR(255),
    CD_SITUACAO_CASSACAO INT,
    DS_SITUACAO_CASSACAO VARCHAR(255),
    CD_SITUACAO_DIPLOMA INT,
    DS_SITUACAO_DIPLOMA VARCHAR(255),
    TP_AGREMIACAO VARCHAR(50),
    NR_PARTIDO INT,
    SG_PARTIDO VARCHAR(20),
    NM_PARTIDO VARCHAR(255),
    NR_FEDERACAO INT,
    NM_FEDERACAO VARCHAR(255),
    SG_FEDERACAO VARCHAR(50),
    DS_COMPOSICAO_FEDERACAO VARCHAR(255),
    SQ_COLIGACAO BIGINT,
    NM_COLIGACAO VARCHAR(255),
    DS_COMPOSICAO_COLIGACAO VARCHAR(255),
    ST_VOTO_EM_TRANSITO CHAR(1),
    QT_VOTOS_NOMINAIS INT,
    NM_TIPO_DESTINACAO_VOTOS VARCHAR(255),
    QT_VOTOS_NOMINAIS_VALIDOS INT,
    CD_SIT_TOT_TURNO INT,
    DS_SIT_TOT_TURNO VARCHAR(255)
    PRIMARY KEY (SQ_CANDIDATO, CD_ELEICAO, NR_TURNO, NR_ZONA)
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

SET @caminhoArquivo = 'C:\Users\natha\Documents\MBA\SQL\votacao\'

DECLARE cursor_arquivos CURSOR FOR
SELECT 'votacao_candidato_munzona_2024_AC.csv' AS nomeArquivo
UNION ALL
SELECT 'votacao_candidato_munzona_2024_AL.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_AM.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_AP.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_BA.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_CE.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_ES.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_GO.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_MA.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_MG.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_MS.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_MT.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_PA.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_PB.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_PE.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_PI.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_PR.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_RJ.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_RN.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_RO.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_RS.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_SC.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_SE.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_SP.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_TO.csv'
UNION ALL
SELECT 'votacao_candidato_munzona_2024_RR.csv';

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

INSERT INTO SITUACAO_TURNO (CD_SIT_TOT_TURNO, DS_SIT_TOT_TURNO)
SELECT DISTINCT CD_SIT_TOT_TURNO, DS_SIT_TOT_TURNO
from dbo.Temporaria;

-- Carga da tabela Votacao
INSERT INTO VOTACAO (SQ_CANDIDATO,
					CD_ELEICAO,
					NR_TURNO,
					SG_UF,
					CD_SIT_TOT_TURNO,
					CD_MUNICIPIO,
					NM_MUNICIPIO,
					NR_ZONA,
					ST_VOTO_EM_TRANSITO,
					QT_VOTOS_NOMINAIS,
					NM_TIPO_DESTINACAO_VOTOS,
					QT_VOTOS_NOMINAIS_VALIDOS
)
SELECT DISTINCT SQ_CANDIDATO,
				CD_ELEICAO,
				NR_TURNO,
				SG_UF,
				CD_SIT_TOT_TURNO,
				CD_MUNICIPIO,
				NM_MUNICIPIO,
				NR_ZONA,
				ST_VOTO_EM_TRANSITO,
				QT_VOTOS_NOMINAIS,
				NM_TIPO_DESTINACAO_VOTOS,
				QT_VOTOS_NOMINAIS_VALIDOS
from Temporaria

DROP TABLE Temporaria;