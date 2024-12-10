
CREATE PROCEDURE sp_exibir_candidatos_por_uf
    @uf CHAR(2) 
AS
BEGIN
    IF OBJECT_ID('tempdb..#temp_candidatos_uf') IS NOT NULL
        DROP TABLE #temp_candidatos_uf;
    CREATE TABLE #temp_candidatos_uf (
        SQ_CANDIDATO BIGINT,
        NM_CANDIDATO NVARCHAR(100),
        NM_URNA_CANDIDATO NVARCHAR(100),
        NM_SOCIAL_CANDIDATO NVARCHAR(100),
        NR_CANDIDATO INT,
        SG_UE bigint,
        SG_PARTIDO CHAR(10),
        NM_PARTIDO NVARCHAR(100),
        DS_CARGO NVARCHAR(50),
        DS_GRAU_INSTRUCAO NVARCHAR(50),
        DS_OCUPACAO NVARCHAR(100),
        QT_VOTOS_NOMINAIS_VALIDOS BIGINT,
        VR_TOTAL_BENS DECIMAL(18,2),
        VR_BEM_MAIOR DECIMAL(18,2),
        DS_TIPO_REDE_SOCIAL NVARCHAR(500),
        DS_URL NVARCHAR(255)
    );
    INSERT INTO #temp_candidatos_uf
    SELECT
        SQ_CANDIDATO,
        NM_CANDIDATO,
        NM_URNA_CANDIDATO,
        NM_SOCIAL_CANDIDATO,
        NR_CANDIDATO,
        SG_UE,
        SG_PARTIDO,
        NM_FEDERACAO,
        DS_CARGO,
        DS_GRAU_INSTRUCAO,
        DS_OCUPACAO,
        QT_VOTOS_NOMINAIS_VALS,
        VR_TOTAL_BENS,
        VR_BEM_MAIOR,IDO
        DS_TIPO_REDE_SOCIAL,
        DS_URL
    FROM vw_detalhes_candidatos
    WHERE  SG_UE = @uf;
    SELECT * FROM #temp_candidatos_uf;
END;

