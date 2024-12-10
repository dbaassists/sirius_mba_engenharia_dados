CREATE TABLE rede_social (
  SQ_CANDIDATO BIGINT,                    
  NR_ORDEM_REDE_SOCIAL BIGINT,             
  DS_URL NVARCHAR(2048),   
  CD_TIPO_REDE_SOCIAL INT,             
  PRIMARY KEY (SQ_CANDIDATO, NR_ORDEM_REDE_SOCIAL),
  FOREIGN KEY (CD_TIPO_REDE_SOCIAL) REFERENCES tipo_rede_social(CD_TIPO_REDE_SOCIAL)
);

WAITFOR DELAY '00:00:05';

WITH analise_rede_social AS (
    SELECT
        SQ_CANDIDATO,
        NR_ORDEM_REDE_SOCIAL,
        DS_URL,
        CASE 
            WHEN DS_URL LIKE '%instagram%' THEN 'Instagram'
            WHEN DS_URL LIKE '%facebook%' THEN 'Facebook'
            WHEN DS_URL LIKE '%wa.me%' THEN 'WhatsApp'
            WHEN DS_URL LIKE '%www%' OR DS_URL LIKE '%http%' THEN 'Site'
            WHEN DS_URL IS NULL THEN 'Sem rede social'
            ELSE 'Outro'
        END AS DS_TIPO_REDE_SOCIAL
    FROM rede_social_candidato_2024_BRASIL 
)
INSERT INTO rede_social (SQ_CANDIDATO, NR_ORDEM_REDE_SOCIAL, DS_URL, CD_TIPO_REDE_SOCIAL)
SELECT 
    r.SQ_CANDIDATO,
    r.NR_ORDEM_REDE_SOCIAL,
    r.DS_URL,
    t.CD_TIPO_REDE_SOCIAL  
FROM  analise_rede_social r
LEFT JOIN tipo_rede_social t 
    ON r.DS_TIPO_REDE_SOCIAL = t.DS_TIPO_REDE_SOCIAL; 