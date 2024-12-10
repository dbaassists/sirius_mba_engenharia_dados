-- Atividade 08 – Durante a análise dos dados de CANDIDATO, é necessário identificar os candidatos a VEREADOR da cidade que foram eleitos e a quantidade de votos que receberam. 
-- Em seguida, crie um ranking entre os eleitos, ordenando-os do candidato com o maior número de votos para o que recebeu o menor número.


SELECT
		Candidato.NM_CANDIDATO,
		Candidato.NM_URNA_CANDIDATO,
		Partido.NM_PARTIDO,
		Situacao_Julgamento.DS_SITUACAO_JULGAMENTO,
		SUM(Votacao.QT_VOTOS_NOMINAIS_VALIDOS) AS VOTOS_VALIDOS,
		Situacao_Totalizacao_Turno.DS_SIT_TOT_TURNO
FROM
	dbo.Candidato 
	INNER JOIN dbo.Cargo ON Candidato.CD_CARGO = Cargo.CD_CARGO 
	INNER JOIN dbo.Unidade_Eleitoral ON Candidato.SG_UE = Unidade_Eleitoral.SG_UE
	INNER JOIN dbo.Votacao ON dbo.Votacao.CD_ELEICAO = dbo.Candidato.CD_ELEICAO AND dbo.Votacao.SQ_CANDIDATO = dbo.Candidato.SQ_CANDIDATO
	INNER JOIN dbo.Situacao_Totalizacao_Turno ON dbo.Situacao_Totalizacao_Turno.CD_SIT_TOT_TURNO = Candidato.CD_SIT_TOT_TURNO
	INNER JOIN dbo.Situacao_Julgamento ON dbo.Situacao_Julgamento.CD_SITUACAO_JULGAMENTO = dbo.Candidato.CD_SITUACAO_JULGAMENTO
	INNER JOIN dbo.Partido ON dbo.Partido.NR_PARTIDO = dbo.Candidato.NR_PARTIDO
WHERE dbo.Cargo.DS_CARGO = 'VEREADOR' AND dbo.Unidade_Eleitoral.NM_UE = 'PIRASSUNUNGA' AND dbo.Situacao_Totalizacao_Turno.CD_SIT_TOT_TURNO IN (1, 2, 3)
GROUP BY Candidato.NM_CANDIDATO, Candidato.NM_URNA_CANDIDATO, Partido.NM_PARTIDO, Situacao_Totalizacao_Turno.DS_SIT_TOT_TURNO, Situacao_Julgamento.DS_SITUACAO_JULGAMENTO
ORDER BY VOTOS_VALIDOS DESC