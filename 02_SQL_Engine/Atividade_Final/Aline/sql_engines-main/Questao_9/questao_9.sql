--Atividade 09 – Precisamos criar uma VIEW que forneça todas as informações dos candidatos, 
--incluindo ocupação, partido, votos recebidos, valor dos bens e links para suas redes sociais.


CREATE VIEW vw_detalhes_candidatos AS
SELECT 
     c.SQ_CANDIDATO,
    c.NM_CANDIDATO,
    c.NM_URNA_CANDIDATO,
    c.NM_SOCIAL_CANDIDATO,
    c.NR_CANDIDATO,
    c.SG_UE,
    p.SG_PARTIDO,
    p.NM_FEDERACAO,
    cg.DS_CARGO,
    gi.DS_GRAU_INSTRUCAO,
    oc.DS_OCUPACAO,
    vt.QT_VOTOS_NOMINAIS_VALIDOS,
    ISNULL(SUM(bc.VR_BEM_CANDIDATO), 0) AS VR_TOTAL_BENS,
    MAX(bc.VR_BEM_CANDIDATO) AS VR_BEM_MAIOR,
    trs.DS_TIPO_REDE_SOCIAL,
    rd.DS_URL
FROM 
    candidato c
LEFT JOIN partido p ON c.CD_PARTIDO_CH = p.CD_PARTIDO_CH
LEFT JOIN cargo cg ON c.CD_CARGO = cg.CD_CARGO
LEFT JOIN grau_instrucao gi ON c.CD_GRAU_INSTRUCAO = gi.CD_GRAU_INSTRUCAO
LEFT JOIN ocupacao oc ON c.CD_OCUPACAO = oc.CD_OCUPACAO
LEFT JOIN votacao vt ON c.SQ_CANDIDATO = vt.SQ_CANDIDATO
LEFT JOIN bem_candidato bc ON c.SQ_CANDIDATO = bc.SQ_CANDIDATO
LEFT JOIN rede_social rd ON c.SQ_CANDIDATO = rd.SQ_CANDIDATO
LEFT JOIN tipo_rede_social trs ON rd.CD_TIPO_REDE_SOCIAL = trs.CD_TIPO_REDE_SOCIAL
GROUP BY 
    c.SQ_CANDIDATO,
    c.NM_CANDIDATO,
    c.NM_URNA_CANDIDATO,
    c.NM_SOCIAL_CANDIDATO,
    c.NR_CANDIDATO,
    c.SG_UE,
    p.SG_PARTIDO,
    p.NM_FEDERACAO,
    cg.DS_CARGO,
    gi.DS_GRAU_INSTRUCAO,
    oc.DS_OCUPACAO,
    vt.QT_VOTOS_NOMINAIS_VALIDOS,
    trs.DS_TIPO_REDE_SOCIAL,
    rd.DS_URL;
