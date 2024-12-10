USE elecoes_2024;

CREATE TABLE BEM_CANDIDATO (
	sq_bem_candidato INT PRIMARY KEY AUTO_INCREMENT,
    sq_candidato INT,
    sq_uf INT,
    sq_eleicao INT,
    ordem_bem_candidato INT,
    sq_tipo_bem INT,
    descricao_bem VARCHAR(100),
    valor_bem DECIMAL,
    data_ultima_atualizacao DATE,
    hora_ultima_atualizacao TIME,
    
    FOREIGN KEY (sq_candidato) REFERENCES CANDIDATO(sq_candidato_eleicao),
    FOREIGN KEY (sq_tipo_bem) REFERENCES TIPO_BEM(sq_tipo_bem),
	FOREIGN KEY (sq_uf) REFERENCES UF(sq_uf),
	FOREIGN KEY (sq_eleicao) REFERENCES ELEICAO(sq_eleicao)

);

CREATE TABLE TIPO_BEM (
    sq_tipo_bem INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100)
);



INSERT INTO TIPO_BEM (descricao)
VALUES
('Apartamento'),
('Casa'),
('Terreno'),
('Veículo'),
('Ações'),
('Depósito em conta bancária'),
('Joias'),
('Outros bens móveis');


INSERT INTO BEM_CANDIDATO (
    sq_candidato, sq_uf, sq_eleicao, ordem_bem_candidato, sq_tipo_bem, 
    descricao_bem, valor_bem, data_ultima_atualizacao, hora_ultima_atualizacao
)
VALUES
-- Bens do candidato 101
(101, 1, 7, 1, 1, 'Apartamento em Congonhas', 500000, '2024-01-01', '12:00:00'),
(101, 1, 7, 2, 4, 'Carro Sedan', 70000, '2024-01-01', '12:00:00'),

-- Bens do candidato 102
(102, 1, 8, 1, 2, 'Casa em Congonhas', 300000, '2024-01-01', '13:00:00'),
(102, 1, 8, 2, 6, 'Conta bancária no Banco X', 20000, '2024-01-01', '13:00:00'),

-- Bens do candidato 103
(103, 1, 7, 1, 3, 'Terreno em área rural', 150000, '2024-01-02', '14:00:00'),
(103, 1, 7, 2, 7, 'Joias herdadas', 50000, '2024-01-02', '14:00:00'),

-- Bens do candidato 104
(104, 1, 8, 1, 5, 'Ações na Bolsa', 120000, '2024-01-03', '15:00:00'),
(104, 1, 8, 2, 2, 'Casa na praia', 400000, '2024-01-03', '15:00:00'),

-- Bens do candidato 105
(105, 1, 7, 1, 4, 'Moto esportiva', 30000, '2024-01-04', '16:00:00'),
(105, 1, 7, 2, 8, 'Outros bens móveis diversos', 45000, '2024-01-04', '16:00:00'),

-- Bens do candidato 106
(106, 2, 7, 1, 1, 'Apartamento no centro', 600000, '2024-01-05', '10:00:00'),
(106, 2, 7, 2, 4, 'Carro SUV', 90000, '2024-01-05', '10:00:00'),

-- Bens do candidato 107
(107, 2, 8, 1, 2, 'Casa na capital', 350000, '2024-01-05', '11:00:00'),
(107, 2, 8, 2, 5, 'Ações de empresa Y', 75000, '2024-01-05', '11:00:00'),

-- Continue até o candidato 120
(108, 2, 8, 1, 3, 'Terreno comercial', 250000, '2024-01-06', '09:00:00'),
(108, 2, 8, 2, 7, 'Joias de família', 80000, '2024-01-06', '09:00:00'),
(109, 3, 7, 1, 8, 'Outros bens', 20000, '2024-01-06', '10:00:00'),
(110, 3, 7, 1, 6, 'Conta bancária', 50000, '2024-01-06', '11:00:00'),
(111, 4, 8, 1, 1, 'Apartamento em BH', 450000, '2024-01-06', '12:00:00'),
(112, 4, 8, 1, 2, 'Casa em Nova Lima', 600000, '2024-01-06', '13:00:00');

