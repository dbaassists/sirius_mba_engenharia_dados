SELECT 
    UF.uf,  
    COUNT(c.sq_candidato_eleicao) AS total_candidatos  
FROM 
    CANDIDATO as c
JOIN 
    UF ON c.sq_uf = UF.sq_uf  
WHERE 
    c.sq_cargo = (SELECT sq_cargo FROM CARGO WHERE descricao = 'VEREADOR')  
GROUP BY 
    UF.uf  
ORDER BY 
    total_candidatos DESC;  
