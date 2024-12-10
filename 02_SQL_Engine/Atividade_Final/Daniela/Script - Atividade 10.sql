-- Precisamos criar uma PROCEDURE que receba como parâmetro a UF e exiba, em uma tabela, as informações de todos os candidatos da UF informada. 
-- É importante que essa tabela seja limpa a cada execução da procedure.

CREATE PROCEDURE sp_ObterCandidatosPorUF
    @UF CHAR(2)
AS
BEGIN
    CREATE TABLE #CandidatoTemp (
        NM_URNA_CANDIDATO VARCHAR(100),
        DS_OCUPACAO VARCHAR(255),
        NM_PARTIDO VARCHAR(50),
        LINKS_REDES_SOCIAIS VARCHAR(MAX),
        PATRIMONIO DECIMAL(18, 2),
        DS_SITUACAO_JULGAMENTO VARCHAR(255),
		VOTOS_VALIDOS INT,
		DS_SIT_TOT_TURNO VARCHAR(255)
    );

    -- Inserção dos dados dos candidatos da UF especificada na tabela temporária
    INSERT INTO #CandidatoTemp (NM_URNA_CANDIDATO, DS_OCUPACAO, NM_PARTIDO, LINKS_REDES_SOCIAIS, PATRIMONIO, DS_SITUACAO_JULGAMENTO, VOTOS_VALIDOS, DS_SIT_TOT_TURNO)
	SELECT
		Candidato.NM_URNA_CANDIDATO,
		Ocupacao.DS_OCUPACAO,
		Partido.NM_PARTIDO,
		STRING_AGG(CAST(Rede_Social.DS_URL AS VARCHAR(MAX)), ', ') AS LINKS_REDES_SOCIAIS,
		ISNULL(SUM(Bem_Candidato.VR_BEM_CANDIDATO), 0) AS PATRIMONIO,
		Situacao_Julgamento.DS_SITUACAO_JULGAMENTO,
		AVG(Votacao.QT_VOTOS_NOMINAIS_VALIDOS) AS VOTOS_VALIDOS,
		Situacao_Totalizacao_Turno.DS_SIT_TOT_TURNO
	FROM
		dbo.Candidato 
		INNER JOIN dbo.Cargo ON Candidato.CD_CARGO = Cargo.CD_CARGO 
		INNER JOIN dbo.Unidade_Eleitoral ON Candidato.SG_UE = Unidade_Eleitoral.SG_UE
		INNER JOIN dbo.Votacao ON dbo.Votacao.CD_ELEICAO = dbo.Candidato.CD_ELEICAO AND dbo.Votacao.SQ_CANDIDATO = dbo.Candidato.SQ_CANDIDATO
		INNER JOIN dbo.Situacao_Totalizacao_Turno ON dbo.Situacao_Totalizacao_Turno.CD_SIT_TOT_TURNO = Candidato.CD_SIT_TOT_TURNO
		INNER JOIN dbo.Situacao_Julgamento ON dbo.Situacao_Julgamento.CD_SITUACAO_JULGAMENTO = dbo.Candidato.CD_SITUACAO_JULGAMENTO
		INNER JOIN dbo.Partido ON dbo.Partido.NR_PARTIDO = dbo.Candidato.NR_PARTIDO
		INNER JOIN dbo.Ocupacao ON dbo.Ocupacao.CD_OCUPACAO = dbo.Candidato.CD_OCUPACAO
		INNER JOIN dbo.Grau_Instrucao ON dbo.Grau_Instrucao.CD_GRAU_INSTRUCAO = dbo.Candidato.CD_GRAU_INSTRUCAO
		LEFT JOIN dbo.Rede_Social ON dbo.Rede_Social.CD_ELEICAO = dbo.Candidato.CD_ELEICAO AND dbo.Rede_Social.SQ_CANDIDATO = dbo.Candidato.SQ_CANDIDATO
		LEFT JOIN dbo.Bem_Candidato ON dbo.Bem_Candidato.CD_ELEICAO = dbo.Candidato.CD_ELEICAO AND dbo.Bem_Candidato.SQ_CANDIDATO = dbo.Candidato.SQ_CANDIDATO	
	WHERE dbo.Unidade_Eleitoral.SG_UF = @UF
	GROUP BY Candidato.NM_CANDIDATO, Candidato.NM_URNA_CANDIDATO, Grau_Instrucao.DS_GRAU_INSTRUCAO, Ocupacao.DS_OCUPACAO, Partido.NM_PARTIDO, Situacao_Totalizacao_Turno.DS_SIT_TOT_TURNO, Situacao_Julgamento.DS_SITUACAO_JULGAMENTO
		
    SELECT * FROM #CandidatoTemp;
END;


--EXEC sp_ObterCandidatosPorUF 'SP'