-- Atividade 07 – Analisando a tabela de BENS DE CANDIDATO, é necessário identificar o patrimônio total dos candidatos aos cargos de VEREADOR, PREFEITO e VICE-PREFEITO. 
-- Após essa análise, identifique o bem de maior valor e classifique o candidato conforme o patrimônio total nas seguintes categorias:
-- Patrimônio entre 0 e 999.999,99 – Candidato com Patrimônio Normal
-- Patrimônio entre 1.000.000,00 e 999.999.999,99 – Candidato com Patrimônio Milionário
-- Patrimônio maior que 1.000.000.000,00 – Candidato com Patrimônio Bilionário

SELECT
		Candidato.NM_URNA_CANDIDATO,
		Partido.NM_PARTIDO,
		Cargo.DS_CARGO,
		ISNULL(SUM(VR_BEM_CANDIDATO), 0) AS PATRIMONIO,
		CASE 
				WHEN ISNULL(SUM(VR_BEM_CANDIDATO), 0) <= 999999.99 THEN 'Candidato com Patrimônio Normal'
				WHEN ISNULL(SUM(VR_BEM_CANDIDATO), 0) <= 999999999.99 THEN 'Candidato com Patrimônio Milionário'
				ELSE 'Candidato com Patrimônio Bilionário' END
		AS SITUACAO_PATRIMONIO
FROM
	dbo.Candidato 
	INNER JOIN dbo.Cargo ON Candidato.CD_CARGO = Cargo.CD_CARGO 
	INNER JOIN dbo.Unidade_Eleitoral ON Candidato.SG_UE = Unidade_Eleitoral.SG_UE
	INNER JOIN dbo.Partido ON dbo.Partido.NR_PARTIDO = dbo.Candidato.NR_PARTIDO
	LEFT JOIN dbo.Bem_Candidato ON dbo.Bem_Candidato.CD_ELEICAO = dbo.Candidato.CD_ELEICAO AND dbo.Bem_Candidato.SQ_CANDIDATO = dbo.Candidato.SQ_CANDIDATO	
WHERE dbo.Unidade_Eleitoral.NM_UE = 'PIRASSUNUNGA'
GROUP BY Candidato.NM_URNA_CANDIDATO, Partido.NM_PARTIDO, Cargo.DS_CARGO
ORDER BY PATRIMONIO DESC