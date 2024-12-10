USE eleicoes_2024;

-- Criação das tabelas

CREATE TABLE REDE_SOCIAL (
    sq_rede_social INT PRIMARY KEY AUTO_INCREMENT,
    sq_candidato INT,
    sq_uf INT,
    sq_eleicao INT,
    data_ultima_atualizacao DATE,
    
    nr_ordem_rede_social INT,
    ds_url VARCHAR(200),
    
	FOREIGN KEY (sq_candidato) REFERENCES CANDIDATO(sq_candidato_eleicao),
	FOREIGN KEY (sq_uf) REFERENCES UF(sq_uf),
	FOREIGN KEY (sq_eleicao) REFERENCES ELEICAO(sq_eleicao)
);
       

INSERT INTO REDE_SOCIAL (
    sq_candidato, sq_uf, sq_eleicao, data_ultima_atualizacao, 
    nr_ordem_rede_social, ds_url
)
VALUES
-- Redes sociais para o candidato 101
(101, 1, 7, '2024-01-01', 1, 'https://facebook.com/candidato101'),
(101, 1, 7, '2024-01-01', 2, 'https://twitter.com/candidato101'),

-- Redes sociais para o candidato 102
(102, 1, 8, '2024-01-01', 1, 'https://instagram.com/candidato102'),
(102, 1, 8, '2024-01-01', 2, 'https://linkedin.com/in/candidato102'),

-- Redes sociais para o candidato 103
(103, 1, 7, '2024-01-02', 1, 'https://facebook.com/candidato103'),
(103, 1, 7, '2024-01-02', 2, 'https://youtube.com/candidato103'),

-- Redes sociais para o candidato 104
(104, 1, 8, '2024-01-03', 1, 'https://twitter.com/candidato104'),
(104, 1, 8, '2024-01-03', 2, 'https://facebook.com/candidato104'),

-- Redes sociais para o candidato 105
(105, 1, 7, '2024-01-04', 1, 'https://instagram.com/candidato105'),
(105, 1, 7, '2024-01-04', 2, 'https://youtube.com/candidato105'),

-- Redes sociais para o candidato 106
(106, 2, 7, '2024-01-05', 1, 'https://twitter.com/candidato106'),
(106, 2, 7, '2024-01-05', 2, 'https://linkedin.com/in/candidato106'),

-- Redes sociais para o candidato 107
(107, 2, 8, '2024-01-05', 1, 'https://facebook.com/candidato107'),
(107, 2, 8, '2024-01-05', 2, 'https://instagram.com/candidato107'),

-- Redes sociais para o candidato 108
(108, 2, 8, '2024-01-06', 1, 'https://linkedin.com/in/candidato108'),
(108, 2, 8, '2024-01-06', 2, 'https://twitter.com/candidato108'),

-- Redes sociais para o candidato 109
(109, 3, 7, '2024-01-06', 1, 'https://facebook.com/candidato109'),
(109, 3, 7, '2024-01-06', 2, 'https://instagram.com/candidato109'),

-- Redes sociais para o candidato 110
(110, 3, 7, '2024-01-06', 1, 'https://linkedin.com/in/candidato110'),
(110, 3, 7, '2024-01-06', 2, 'https://youtube.com/candidato110'),

-- Redes sociais para o candidato 111
(111, 4, 8, '2024-01-06', 1, 'https://facebook.com/candidato111'),
(111, 4, 8, '2024-01-06', 2, 'https://twitter.com/candidato111'),

-- Redes sociais para o candidato 112
(112, 4, 8, '2024-01-06', 1, 'https://instagram.com/candidato112'),
(112, 4, 8, '2024-01-06', 2, 'https://linkedin.com/in/candidato112');


	


