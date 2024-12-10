-- 2 - Partido
-- Já carregado em Script - Atividade 1 Script 2.sql

-- 4 - UF
-- Já carregado em Script - Atividade 1 Script 2.sql

-- 5 - Eleição
-- Já carregado em Script - Atividade 1 Script 2.sql

-- 6 - Candidato
-- Já carregado em Script - Atividade 1 Script 2.sql

-- 3 - Situação Turno (Situacao Totalizacao Turno)
-- Já carregado em Script - Atividade 1 Script 2.sql

-- Extra - Municipio
INSERT INTO Municipio (CD_MUNICIPIO, NM_MUNICIPIO)
SELECT DISTINCT CD_MUNICIPIO, NM_MUNICIPIO 
FROM carga_votacao_candidato_munzona

-- 1 - Votação
INSERT INTO Votacao (SQ_CANDIDATO, CD_ELEICAO, CD_MUNICIPIO, NR_ZONA, ST_VOTO_EM_TRANSITO, QT_VOTOS_NOMINAIS, NM_TIPO_DESTINACAO_VOTOS, QT_VOTOS_NOMINAIS_VALIDOS)
SELECT SQ_CANDIDATO, CD_ELEICAO, CD_MUNICIPIO, NR_ZONA, ST_VOTO_EM_TRANSITO, QT_VOTOS_NOMINAIS, NM_TIPO_DESTINACAO_VOTOS, QT_VOTOS_NOMINAIS_VALIDOS
FROM carga_votacao_candidato_munzona