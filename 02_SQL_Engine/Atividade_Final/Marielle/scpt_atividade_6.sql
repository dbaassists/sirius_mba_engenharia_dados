SELECT 
    v.sq_candidato,  
    c.nm_candidato,  
    v.sq_turno,  
    st.ds_situacao_turno,  
    SUM(v.qt_votos_nominais_validos) AS total_votos 
FROM 
    VOTACAO as v
JOIN 
    CANDIDATO as c ON v.sq_candidato = c.sq_candidato_eleicao 
JOIN 
    SITUCAO_TURNO  as st ON v.sq_turno = st.sq_turno  
JOIN 
    ELEICAO  as e ON v.sq_eleicao = e.sq_eleicao  
WHERE 
    c.sq_cargo = (SELECT sq_cargo FROM CARGO WHERE descricao = 'PREFEITO')  
    AND e.nm_ue = 'Congonhas'  -- Filtra pela cidade de Congonhas
GROUP BY 
    v.sq_candidato, c.nm_candidato, v.sq_turno, st.ds_situacao_turno  
ORDER BY 
    total_votos DESC;  
