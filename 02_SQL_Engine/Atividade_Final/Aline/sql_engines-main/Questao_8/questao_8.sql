--Atividade 08 – Durante a análise dos dados de CANDIDATO, é necessário identificar os candidatos
--a VEREADOR da cidade que foram eleitos e a quantidade de votos que receberam. Em seguida, crie um 
--ranking entre os eleitos, ordenando-os do candidato com o maior número de votos para o que recebeu
--o menor número

with analise_candidatos as (
SELECT 
	c.NM_CANDIDATO, 
	e.NR_TURNO, 
	u.NM_UE,
	u.SG_UF,
	ca.DS_CARGO,
	v.QT_VOTOS_NOMINAIS_VALIDOS,
	sc.DS_SIT_TOT_TURNO
FROM candidato c
INNER JOIN cargo ca ON c.CD_CARGO = ca.CD_CARGO
INNER JOIN uf u ON c.SG_UE= u.SG_UE
INNER JOIN votacao v on c.SQ_CANDIDATO=v.SQ_CANDIDATO
INNER JOIN eleicao e on c.CD_ELEICAO = e.CD_ELEICAO and c.CD_TIPO_ELEICAO=e.CD_TIPO_ELEICAO
INNER JOIN situacao_turno sc on v.CD_SIT_TOT_TURNO=sc.CD_SIT_TOT_TURNO
WHERE 
 c.CD_CARGO = 13 and sc.CD_SIT_TOT_TURNO in(1,2,3))

 select *from analise_candidatos
 order by NM_UE, SG_UF, QT_VOTOS_NOMINAIS_VALIDOS desc 
