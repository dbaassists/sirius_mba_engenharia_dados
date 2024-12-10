SELECT 
    c.sq_candidato_eleicao,  
    c.nm_candidato,  
    v.qt_votos_nominais,  
    st.ds_situacao_turno,  
    car.descricao AS cargo  
FROM 
    VOTACAO as v
JOIN 
    CANDIDATO as c ON v.sq_candidato = c.sq_candidato_eleicao  
JOIN 
    CARGO  as car ON c.sq_cargo = car.sq_cargo  
JOIN 
    SITUCAO_TURNO as st ON v.sq_turno = st.sq_turno  
WHERE 
    car.descricao = 'VEREADOR'  
    AND st.ds_situacao_turno = 'ELEITO'  
ORDER BY 
    v.qt_votos_nominais DESC;  
