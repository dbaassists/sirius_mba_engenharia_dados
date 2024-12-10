USE SiriusTSE;
GO

CREATE PROCEDURE dbo.ListarCandidatosPorUF
    @SG_UF CHAR(2)
AS
BEGIN
    -- Limpando a tabela de resultados (se necessário, crie a tabela de resultados primeiro)
    IF OBJECT_ID('dbo.ResultadosUF') IS NOT NULL
    BEGIN
        TRUNCATE TABLE dbo.ResultadosUF; -- Limpa os dados da tabela
    END

    -- Caso a tabela de resultados não exista, crie-a
    IF OBJECT_ID('dbo.ResultadosUF') IS NULL
    BEGIN
        CREATE TABLE dbo.ResultadosUF (
            SQ_CANDIDATO BIGINT,
            NR_TURNO INT,
            NM_CANDIDATO VARCHAR(200),
            NM_URNA_CANDIDATO VARCHAR(100),
            SG_UF CHAR(2),
            CD_CARGO INT,
            DS_CARGO VARCHAR(100),
            CD_SITUACAO_CANDIDATURA INT,
            DS_SITUACAO_CANDIDATURA VARCHAR(100)
        );
    END

    INSERT INTO dbo.ResultadosUF (SQ_CANDIDATO, NR_TURNO, NM_CANDIDATO, NM_URNA_CANDIDATO, SG_UF, CD_CARGO, DS_CARGO, CD_SITUACAO_CANDIDATURA, DS_SITUACAO_CANDIDATURA)
    SELECT 
        C.SQ_CANDIDATO,
        C.NR_TURNO,
        C.NM_CANDIDATO,
        C.NM_URNA_CANDIDATO,
        C.SG_UF,
        C.CD_CARGO,
        Ca.DS_CARGO,
        C.CD_SITUACAO_CANDIDATURA,
        Sc.DS_SITUACAO_CANDIDATURA
    FROM 
        CANDIDATO C
    JOIN 
        CARGO Ca ON C.CD_CARGO = Ca.CD_CARGO
    JOIN 
        SITUACAO_CANDIDATURA Sc ON C.CD_SITUACAO_CANDIDATURA = Sc.CD_SITUACAO_CANDIDATURA
    WHERE 
        C.SG_UF = @SG_UF 
    ORDER BY 
        C.NM_CANDIDATO;

    SELECT * FROM dbo.ResultadosUF;
END;
GO

EXEC dbo.ListarCandidatosPorUF @SG_UF = 'BA';