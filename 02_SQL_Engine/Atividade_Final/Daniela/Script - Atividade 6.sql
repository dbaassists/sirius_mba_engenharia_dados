-- Atividade 06 – Analisando a tabela de VOTAÇÃO, precisamos contabilizar o total de votos da cidade que você reside para o cargo de PREFEITO. 
-- Certifique-se de identificar a situação de turno de cada candidato.


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
WHERE dbo.Cargo.DS_CARGO = 'PREFEITO' AND dbo.Unidade_Eleitoral.NM_UE = 'PIRASSUNUNGA'
GROUP BY Candidato.NM_CANDIDATO, Candidato.NM_URNA_CANDIDATO, Partido.NM_PARTIDO, Situacao_Totalizacao_Turno.DS_SIT_TOT_TURNO, Situacao_Julgamento.DS_SITUACAO_JULGAMENTO
ORDER BY VOTOS_VALIDOS DESC