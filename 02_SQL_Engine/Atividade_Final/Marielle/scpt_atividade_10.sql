DELIMITER $$

CREATE PROCEDURE PR_CADIDATOS_UF(IN uf_param CHAR(2))
BEGIN
    -- Limpar a tabela temporária 
    TRUNCATE TABLE CANDIDATOS_UF;  
    
    -- Inserir os dados dos candidatos na tabela 
    INSERT INTO CANDIDATOS_UF (sq_candidato, nm_candidato, ds_cor_raca, ocupacao, partido, qt_votos_nominais, valor_bem, link_rede_social)
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
        PARTIDO as p ON c.sq_partido = p.sq_partido  
    JOIN 
        VOTACAO as v ON c.sq_candidato_eleicao = v.sq_candidato  
    JOIN 
        BEM_CANDIDATO as bc ON c.sq_candidato_eleicao = bc.sq_candidato  
    LEFT JOIN 
        REDE_SOCIAL as rs ON c.sq_candidato_eleicao = rs.sq_candidato  
    WHERE 
        c.sq_uf = (SELECT sq_uf FROM UF WHERE uf = uf_param)  
    ORDER BY 
        v.qt_votos_nominais DESC;  
END$$

DELIMITER ;
