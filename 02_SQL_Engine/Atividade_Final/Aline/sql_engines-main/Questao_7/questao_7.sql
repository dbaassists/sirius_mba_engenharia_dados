--Atividade 07 – Analisando a tabela de BENS DE CANDIDATO, é necessário identificar o patrimônio 
--total dos candidatos aos cargos de VEREADOR, PREFEITO e VICE-PREFEITO. Após essa análise, identifique 
--o bem de maior valor e classifique o candidato conforme o patrimônio total nas seguintes categorias:

--Patrimônio entre 0 e 999.999,99 – Candidato com Patrimônio Normal
--Patrimônio entre 1.000.000,00 e 999.999.999,99 – Candidato com Patrimônio Milionário
--Patrimônio maior que 1.000.000.000,00 – Candidato com Patrimônio Bilionário

WITH analise_bem_candidato AS (
    SELECT 
        c.SQ_CANDIDATO,
        c.NM_URNA_CANDIDATO,
        SUM(bc.VR_BEM_CANDIDATO) AS Valor_Total_Bem_Candidato
    FROM candidato c
    INNER JOIN bem_candidato bc ON c.SQ_CANDIDATO = bc.SQ_CANDIDATO
    GROUP BY c.SQ_CANDIDATO, c.NM_URNA_CANDIDATO
),
analise_valor_patrimonial as (
SELECT 
	SQ_CANDIDATO,
    NM_URNA_CANDIDATO,
	Valor_Total_Bem_Candidato,
    CASE 
        WHEN Valor_Total_Bem_Candidato BETWEEN 0 AND 999999.99 THEN 'Patrimônio Normal'
        WHEN Valor_Total_Bem_Candidato BETWEEN 1000000.00 AND 999999999.99 THEN 'Patrimônio Milionário'
        ELSE 'Patrimônio Bilionário'
    END AS Categoria_Patrimonio
FROM analise_bem_candidato
)

select 
Top 1 *
from analise_valor_patrimonial
order by Valor_Total_Bem_Candidato desc