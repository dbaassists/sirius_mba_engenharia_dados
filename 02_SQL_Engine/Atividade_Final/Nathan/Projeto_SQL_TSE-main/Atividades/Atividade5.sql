USE SiriusTSE;
GO

SELECT 
    C.SG_UF,                          
    COUNT(*) AS total_candidatos,      
    RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking 
FROM 
    CANDIDATO C
JOIN 
    CARGO CA ON C.CD_CARGO = CA.CD_CARGO  
WHERE 
    CA.DS_CARGO = 'VEREADOR'           
GROUP BY 
    C.SG_UF                          
ORDER BY 
    total_candidatos DESC;                  