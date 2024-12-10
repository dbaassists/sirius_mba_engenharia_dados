
CREATE TABLE tipo_rede_social (
    CD_TIPO_REDE_SOCIAL INT IDENTITY(1,1) PRIMARY KEY,     
    DS_TIPO_REDE_SOCIAL NVARCHAR(255)        
);

WAITFOR DELAY '00:00:05';


INSERT INTO tipo_rede_social (DS_TIPO_REDE_SOCIAL)
SELECT DISTINCT 
    CASE 
        WHEN DS_URL LIKE '%instagram%' THEN 'Instagram'
        WHEN DS_URL LIKE '%facebook%' THEN 'Facebook'
        WHEN DS_URL LIKE '%wa.me%' THEN 'WhatsApp'
        WHEN DS_URL LIKE '%www%' OR DS_URL LIKE '%http%' THEN 'Site'
		WHEN DS_URL is null Then 'Sem rede social'
        ELSE 'Outro'
    END AS DS_TIPO_REDE_SOCIAL
FROM rede_social_candidato_2024_BRASIL