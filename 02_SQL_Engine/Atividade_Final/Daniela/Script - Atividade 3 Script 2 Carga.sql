-- 2 - UF (Aproveitar a mesma tabela criada na Atividade 01)
-- Já carregada (Script - Atividade 1 Script 2.sql)

-- 4 - Eleição (Aproveitar a mesma tabela criada na Atividade 01)
-- Já carregada (Script - Atividade 1 Script 2.sql)

-- 5 - Candidato (Aproveitar a mesma tabela criada na Atividade 01)
-- Já carregada (Script - Atividade 1 Script 2.sql)

-- 3 - Tipo de Rede Social - Preenchimento Manual
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (1, 'Instagram');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (2, 'Facebook');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (3, 'Tiktok');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (4, 'Linkedin');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (5, 'Whatsapp');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (6, 'Twitter / X');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (7, 'Threads');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (8, 'Youtube');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (9, 'Kawai');
INSERT INTO [dbo].[Tipo_Rede_Social] ([CD_TIPO_REDE_SOCIAL], [DS_TIPO_REDE_SOCIAL]) VALUES (10, 'Site próprio / Outro');

-- 1 - Rede Social
INSERT INTO Rede_Social (SQ_CANDIDATO, CD_ELEICAO, NR_ORDEM_REDE_SOCIAL, CD_TIPO_REDE_SOCIAL, DS_URL)
SELECT TRIM(SQ_CANDIDATO), CD_ELEICAO, NR_ORDEM_REDE_SOCIAL, NULL, DS_URL
FROM carga_rede_social_candidato
WHERE TRIM(SQ_CANDIDATO) IN (SELECT SQ_CANDIDATO FROM Candidato)

UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 1 WHERE DS_URL LIKE '%instragram%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 1 WHERE DS_URL LIKE '%instragam%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 1 WHERE DS_URL LIKE '%instagram%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 1 WHERE DS_URL LIKE '%instagran%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 2 WHERE DS_URL LIKE '%facebook%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 4 WHERE DS_URL LIKE 'linkedin%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 5 WHERE DS_URL LIKE '%wa.me%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 5 WHERE DS_URL LIKE '%api.whatsapp%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 5 WHERE DS_URL LIKE '%tiktok%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 6 WHERE DS_URL LIKE '%twitter%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 6 WHERE DS_URL LIKE '%x.com%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 7 WHERE DS_URL LIKE '%threads%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 8 WHERE DS_URL LIKE '%youtube%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 8 WHERE DS_URL LIKE '%youtu.be%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 9 WHERE DS_URL LIKE '%kawai%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 9 WHERE DS_URL LIKE '%kwai%';
UPDATE Rede_Social SET CD_TIPO_REDE_SOCIAL = 10 WHERE CD_TIPO_REDE_SOCIAL IS NULL;