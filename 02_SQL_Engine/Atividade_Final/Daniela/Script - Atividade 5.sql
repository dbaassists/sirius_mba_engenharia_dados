--Analisando a tabela de CANDIDATO, o cliente solicitou uma lista contendo o total de candidatos concorrendo ao cargo de VEREADOR. 
--É necessário criar um ranking para identificar os estados com o maior número de candidatos até os que possuem o menor número.

SELECT
	Unidade_Federacao.SG_UF, 
	Unidade_Federacao.DS_UF,
	COUNT(*) AS Quantidade
FROM
	dbo.Candidato 
	INNER JOIN dbo.Cargo ON Candidato.CD_CARGO = Cargo.CD_CARGO 
	INNER JOIN dbo.Unidade_Eleitoral ON Candidato.SG_UE = Unidade_Eleitoral.SG_UE
	INNER JOIN dbo.Unidade_Federacao ON Unidade_Eleitoral.SG_UF = Unidade_Federacao.SG_UF
WHERE Cargo.DS_CARGO = 'VEREADOR'
GROUP BY Unidade_Federacao.SG_UF, Unidade_Federacao.DS_UF
ORDER BY Quantidade DESC