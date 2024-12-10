SELECT 
    c.sq_candidato_eleicao,  
    c.nm_candidato,  
    car.sq_cargo,  
    ca.descricao AS cargo,  
    SUM(bc.valor_bem) AS patrimonio_total,  
    MAX(bc.valor_bem) AS maior_bem,  
    CASE 
        WHEN SUM(BC.valor_bem) BETWEEN 0 AND 999999.99 THEN 'Patrimônio Normal'
        WHEN SUM(BC.valor_bem) BETWEEN 1000000 AND 999999999.99 THEN 'Patrimônio Milionário'
        WHEN SUM(BC.valor_bem) > 1000000000 THEN 'Patrimônio Bilionário'
    END AS classificacao_patrimonio  
FROM 
    BEM_CANDIDATO as bc
JOIN 
    CANDIDATO  as c ON BEM_CANDIDATO.sq_candidato = CANDIDATO.sq_candidato_eleicao  
JOIN 
    CARGO as car ON CANDIDATO.sq_cargo = CARGO.sq_cargo  
WHERE 
    c.sq_cargo IN (  
        SELECT sq_cargo FROM CARGO WHERE descricao IN ('VEREADOR', 'PREFEITO', 'VICE-PREFEITO')
    )
GROUP BY 
    c.sq_candidato_eleicao, c.nm_candidato, c.sq_cargo, car.descricao  
ORDER BY 
    patrimonio_total DESC;  
