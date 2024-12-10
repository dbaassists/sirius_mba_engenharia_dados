USE eleicoes_2024;

-- Criação das tabelas

CREATE TABLE VOTACAO (
    sq_votacao INT PRIMARY KEY AUTO_INCREMENT,
    sq_candidato INT,
    sq_uf INT,
    sq_eleicao INT,
    sq_partido INT,
    sq_turno INT,
    
	FOREIGN KEY (sq_candidato) REFERENCES CANDIDATO(sq_candidato_eleicao),
	FOREIGN KEY (sq_uf) REFERENCES UF(sq_uf),
	FOREIGN KEY (sq_eleicao) REFERENCES ELEICAO(sq_eleicao),
    FOREIGN KEY (sq_partido) REFERENCES PARTIDO(sq_partido),
    FOREIGN KEY (sq_turno) REFERENCES SITUCAO_TURNO(sq_turno)
    
);

CREATE TABLE PARTIDO (
	sq_partido INT PRIMARY KEY AUTO_INCREMENT,
    nr_partido INT,
    sg_partido VARCHAR(10),
    nm_partido VARCHAR(100),
    nr_federacao INT,
    sg_federacao VARCHAR(50),
    ds_comp_federecao VARCHAR(100)
);
    
    
CREATE TABLE SITUCAO_TURNO (
	sq_turno INT PRIMARY KEY AUTO_INCREMENT,
	qt_votos_nominais INT,
    nm_tipo_votos VARCHAR (20),
    qt_votos_nominais_validos INT,
    cd_situacao_turno INT,
    ds_situacao_turno VARCHAR (20)
);


INSERT INTO PARTIDO (nr_partido, sg_partido, nm_partido, nr_federacao, sg_federacao, ds_comp_federecao)
VALUES
(1, 'PT', 'Partido dos Trabalhadores', 1, 'Federação Brasil', 'Composição completa'),
(2, 'PSDB', 'Partido da Social Democracia Brasileira', 2, 'Federação Progresso', 'Composição completa'),
(3, 'PL', 'Partido Liberal', 3, 'Federação Liberdade', 'Composição parcial'),
(4, 'PSOL', 'Partido Socialismo e Liberdade', 4, 'Federação Unidade', 'Composição mínima'),
(5, 'MDB', 'Movimento Democrático Brasileiro', 5, 'Federação Nacional', 'Composição completa');

INSERT INTO SITUCAO_TURNO (qt_votos_nominais, nm_tipo_votos, qt_votos_nominais_validos, cd_situacao_turno, ds_situacao_turno)
VALUES
(50000, 'Votos válidos', 48000, 1, 'SUPLENTE'),
(40000, 'Votos válidos', 39000, 2, 'NÃO ELEITO'),
(60000, 'Votos válidos', 59000, 3, 'ELEITO POR MÉDIA'),
(55000, 'Votos válidos', 54000, 4, '2º TURNO'),
(70000, 'Votos válidos', 69000, 5, 'ELEITO POR QP');

INSERT INTO VOTACAO (sq_candidato, sq_uf, sq_eleicao, sq_partido, sq_turno)
VALUES
-- SUPLENTE
(101, 1, 7, 1, 1),
(102, 1, 8, 2, 1),

-- NÃO ELEITO
(103, 1, 7, 3, 2),
(104, 1, 8, 4, 2),

-- ELEITO POR MÉDIA
(105, 1, 7, 5, 3),
(106, 2, 7, 1, 3),

-- 2º TURNO
(107, 2, 8, 2, 4),
(108, 2, 8, 3, 4),

-- ELEITO POR QP
(109, 3, 7, 4, 5),
(110, 3, 7, 5, 5),

-- SUPLENTE (novos candidatos)
(111, 4, 8, 1, 1),
(112, 4, 8, 2, 1),

-- NÃO ELEITO (novos candidatos)
(113, 4, 7, 3, 2),
(114, 4, 8, 4, 2),

-- ELEITO POR MÉDIA (novos candidatos)
(115, 5, 7, 5, 3),
(116, 5, 8, 1, 3),

-- 2º TURNO (novos candidatos)
(117, 5, 8, 2, 4),
(118, 5, 7, 3, 4),

-- ELEITO POR QP (novos candidatos)
(119, 6, 7, 4, 5),
(120, 6, 8, 5, 5);





