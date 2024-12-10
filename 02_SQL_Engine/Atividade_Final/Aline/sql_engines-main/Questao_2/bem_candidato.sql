use eleicao
GO
CREATE TABLE bem_candidato (
    DT_GERACAO DATETIME,                        
    HH_GERACAO NVARCHAR(8),                    
    SQ_CANDIDATO BIGINT,                          
    NR_ORDEM_BEM_CANDIDATO BIGINT,                 
    DS_TIPO_BEM_CANDIDATO NVARCHAR(255),             
    VR_BEM_CANDIDATO DECIMAL(18, 2),            
    DT_ULT_ATUAL_BEM_CANDIDATO DATETIME,        
    HH_ULT_ATUAL_BEM_CANDIDATO NVARCHAR(8),
    PRIMARY KEY (SQ_CANDIDATO, NR_ORDEM_BEM_CANDIDATO)
);

INSERT INTO bem_candidato (
	DT_GERACAO,                        
    HH_GERACAO,                    
    SQ_CANDIDATO,                          
    NR_ORDEM_BEM_CANDIDATO,                 
    DS_TIPO_BEM_CANDIDATO,             
    VR_BEM_CANDIDATO,            
    DT_ULT_ATUAL_BEM_CANDIDATO,        
    HH_ULT_ATUAL_BEM_CANDIDATO
)

WAITFOR DELAY '00:00:05';

SELECT 
   	DT_GERACAO,                        
    HH_GERACAO,                    
    SQ_CANDIDATO,                          
    NR_ORDEM_BEM_CANDIDATO,                 
    DS_TIPO_BEM_CANDIDATO,             
    VR_BEM_CANDIDATO,            
    DT_ULT_ATUAL_BEM_CANDIDATO,        
    HH_ULT_ATUAL_BEM_CANDIDATO
FROM bem_candidato_2024_BRASIL;

GO