CREATE VIEW CANDIDATOS_INFORMACOES AS
SELECT 
    c.sq_candidato_eleicao,  
    c.nm_candidato,  
    c.ds_cor_raca,  
    o.descricao AS ocupacao,  
    p.nome AS partido,  
    v.qt_votos_nominais,  
    bc.valor_bem,  
    rs.ds_url AS link_rede_social  
FROM 
    CANDIDATO as c
JOIN 
    OCUPACAO as o ON c.sq_ocupacao = o.sq_ocupacao  
JOIN 
    PARTIDO  as p ON c.sq_partido = p.sq_partido  
JOIN 
    VOTACAO as v ON c.sq_candidato_eleicao = v.sq_candidato  
JOIN 
    BEM_CANDIDATO as bc ON c.sq_candidato_eleicao = bc.sq_candidato  
LEFT JOIN 
    REDE_SOCIAL as rs ON c.sq_candidato_eleicao = rs.sq_candidato  
WHERE 
    v.qt_votos_nominais IS NOT NULL  
ORDER BY 
    v.qt_votos_nominais DESC;  
