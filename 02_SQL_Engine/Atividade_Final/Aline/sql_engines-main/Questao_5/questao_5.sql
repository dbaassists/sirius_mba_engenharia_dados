 --Analisando a tabela de CANDIDATO, o cliente solicitou uma lista contendo o total de candidatos 
 --concorrendo ao cargo de VEREADOR. É necessário criar um ranking para identificar os estados 
 --com o maior número de candidatos até os que possuem o menor número.

with analise_rank_vereador as (
SELECT 
    u.SG_UF AS Estado,
    COUNT(*) AS Total_Candidatos
FROM candidato c
INNER JOIN cargo ca ON c.CD_CARGO = ca.CD_CARGO
INNER JOIN uf u ON c.SG_UE= u.SG_UE
WHERE 
    c.CD_CARGO = 13
GROUP BY 
    u.SG_UF)

select 
Estado,
Total_Candidatos
from analise_rank_vereador
order by Total_Candidatos desc