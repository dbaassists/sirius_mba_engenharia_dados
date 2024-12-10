--Atividade 06 – Analisando a tabela de VOTAÇÃO, precisamos contabilizar o 
--total de votos da cidade que você reside para o cargo de PREFEITO. Certifique-se de identificar a 
--situação de turno de cada candidato.

SELECT 
	c.NM_CANDIDATO,
	e.NR_TURNO,
	sum(v.QT_VOTOS_NOMINAIS_VALIDOS) as soma_votos 
FROM candidato c
INNER JOIN cargo ca ON c.CD_CARGO = ca.CD_CARGO
INNER JOIN uf u ON c.SG_UE= u.SG_UE
INNER JOIN votacao v on c.SQ_CANDIDATO=v.SQ_CANDIDATO
INNER JOIN eleicao e on c.CD_ELEICAO = e.CD_ELEICAO and c.CD_TIPO_ELEICAO=e.CD_TIPO_ELEICAO
WHERE 
 u.NM_UE='Juiz de Fora' and u.SG_UF='MG'  and  c.CD_CARGO = 11
group by c.NM_CANDIDATO, e.NR_TURNO
order by soma_votos desc