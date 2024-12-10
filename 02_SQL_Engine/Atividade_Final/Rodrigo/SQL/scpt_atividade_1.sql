CREATE database eleicoes_2024;

USE eleicoes_2024;

-- Criação das tabelas

CREATE TABLE CANDIDATO (
    sq_candidato_eleicao INT PRIMARY KEY AUTO_INCREMENT,
    nr_candidato INT,
    nm_candidato VARCHAR(200),
    nr_CPF INT,
	data_nascimento DATE,
    cd_genenro INT,
    ds_genero VARCHAR(10),
    cd_estado_civil INT,
    ds_estado_civil VARCHAR(20),
    tipo_eleicao INT,
	titulo_eleitoral CHAR(12),
    ds_cor_raca VARCHAR(20),
    
	sq_uf INT,
	sq_cargo INT,
    sq_candidatura INT,   
    sq_partido INT,
	sq_grau_instrucao INT,
	sq_ocupacao INT,
    sq_eleicao INT,
    sq_bem_candidato INT,
    sq_rede_social INT,
       
   
	FOREIGN KEY (sq_uf) REFERENCES UF(sq_uf),
	FOREIGN KEY (sq_cargo) REFERENCES CARGO(sq_cargo),
	FOREIGN KEY (sq_candidatura) REFERENCES SITUACAO_CANDIDATURA(sq_situacao_candidatura),
    FOREIGN KEY (sq_partido) REFERENCES PARTIDO(sq_partido),
	FOREIGN KEY (sq_grau_instrucao) REFERENCES GRAU_INSTRUCAO(sq_grau_instrucao),
	FOREIGN KEY (sq_ocupacao) REFERENCES OCUPACAO(sq_ocupacao),
	FOREIGN KEY (sq_eleicao) REFERENCES ELEICAO(sq_eleicao),
    FOREIGN KEY (sq_bem_candidatO) REFERENCES BEM_CANDIDATO(sq_bem_candidato),
    FOREIGN KEY (sq_rede_social) REFERENCES REDE_SOCIAL(sq_rede_social)
);

CREATE TABLE UF (
	sq_uf INT PRIMARY KEY AUTO_INCREMENT,
	uf CHAR(2),
    uf_nascimento CHAR(2)
);

CREATE TABLE CARGO (
    sq_cargo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50)
);

CREATE TABLE SITUACAO_CANDIDATURA (
    sq_situacao_candidatura INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20)
);


CREATE TABLE PARTIDO (
    sq_partido INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(15),
    nome VARCHAR(50)
);


CREATE TABLE GRAU_INSTRUCAO (
    sq_grau_instrucao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20)
);

CREATE TABLE OCUPACAO (
    sq_ocupacao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50)
);

CREATE TABLE ELEICAO (
	sq_eleicao INT PRIMARY KEY AUTO_INCREMENT,
    ano CHAR(4),
    cd_tipo_eleicao INT(1),
    nm_tipo_eleicao VARCHAR(50),
    nr_turno INT(1),
    cd_eleicao INT,
    ds_eleicao VARCHAR(50),
    data_eleicao DATE,
    cd_cargo INT,
    ds_cargo VARCHAR(25),
    nr_candidato INT,
    nm_ue VARCHAR(50),
    cd_cargo INT,
    ds_cargo VARCHAR(25),
    nr_candidato INT,
	nm_urna VARCHAR(100),
    sq_uf INT,
    
    FOREIGN KEY (sq_uf) REFERENCES UF(sq_uf)
    );
    

-- Inserção ficticia de dados

USE eleicoes_2024;

INSERT INTO CANDIDATO (
    nr_candidato, nm_candidato, nr_CPF, data_nascimento, cd_genenro, ds_genero, cd_estado_civil, 
    ds_estado_civil, tipo_eleicao, titulo_eleitoral, ds_cor_raca, sq_uf, sq_cargo, sq_candidatura, 
    sq_partido, sq_grau_instrucao, sq_ocupacao, sq_eleicao
)
VALUES
(101, 'Candidato Congonhas 1', 12345678901, '1980-01-01', 1, 'Masculino', 1, 'Solteiro', 
 1, '123456789012', 'Branca', 1, 2, 3, 4, 5, 6, 7),
(102, 'Candidato Congonhas 2', 12345678902, '1985-02-01', 2, 'Feminino', 2, 'Casado', 
 1, '123456789013', 'Parda', 1, 3, 4, 5, 6, 7, 8),
(103, 'Candidato Congonhas 3', 12345678903, '1990-03-01', 1, 'Masculino', 3, 'Divorciado', 
 1, '123456789014', 'Preta', 1, 2, 3, 4, 5, 6, 7),
(104, 'Candidato Congonhas 4', 12345678904, '1975-04-01', 2, 'Feminino', 4, 'Viúvo', 
 1, '123456789015', 'Amarela', 1, 3, 4, 5, 6, 7, 8),
(105, 'Candidato Congonhas 5', 12345678905, '2000-05-01', 1, 'Masculino', 1, 'Solteiro', 
 1, '123456789016', 'Indígena', 1, 2, 3, 4, 5, 6, 7),
(106, 'Candidato MG 1', 12345678906, '1980-06-01', 2, 'Feminino', 2, 'Casado', 
 1, '123456789017', 'Branca', 1, 3, 4, 5, 6, 7, 8),
(107, 'Candidato MG 2', 12345678907, '1992-03-14', 1, 'Masculino', 1, 'Solteiro', 
 1, '123456789018', 'Parda', 2, 2, 3, 4, 5, 6, 7),
(108, 'Candidato MG 3', 12345678908, '1985-11-23', 2, 'Feminino', 2, 'Casado', 
 1, '123456789019', 'Preta', 2, 3, 4, 5, 6, 7, 8),
(109, 'Candidato MG 4', 12345678909, '1978-09-09', 1, 'Masculino', 4, 'Viúvo', 
 1, '123456789020', 'Amarela', 3, 2, 3, 4, 5, 6, 7),
(110, 'Candidato MG 5', 12345678910, '1999-07-30', 2, 'Feminino', 3, 'Divorciado', 
 1, '123456789021', 'Indígena', 3, 3, 4, 5, 6, 7, 8),
(111, 'Candidato MG 6', 12345678911, '1981-05-15', 1, 'Masculino', 1, 'Solteiro', 
 1, '123456789022', 'Branca', 4, 2, 3, 4, 5, 6, 7),
(112, 'Candidato MG 7', 12345678912, '1987-08-19', 2, 'Feminino', 2, 'Casado', 
 1, '123456789023', 'Parda', 4, 3, 4, 5, 6, 7, 8),
(113, 'Candidato MG 8', 12345678913, '1975-12-25', 1, 'Masculino', 4, 'Viúvo', 
 1, '123456789024', 'Preta', 5, 2, 3, 4, 5, 6, 7),
(114, 'Candidato MG 9', 12345678914, '1989-01-10', 2, 'Feminino', 3, 'Divorciado', 
 1, '123456789025', 'Amarela', 5, 3, 4, 5, 6, 7, 8),
(115, 'Candidato MG 10', 12345678915, '1995-04-04', 1, 'Masculino', 1, 'Solteiro', 
 1, '123456789026', 'Indígena', 6, 2, 3, 4, 5, 6, 7),
(116, 'Candidato MG 11', 12345678916, '1993-06-14', 2, 'Feminino', 2, 'Casado', 
 1, '123456789027', 'Branca', 6, 3, 4, 5, 6, 7, 8),
(117, 'Candidato MG 12', 12345678917, '1984-02-27', 1, 'Masculino', 3, 'Divorciado', 
 1, '123456789028', 'Parda', 7, 2, 3, 4, 5, 6, 7),
(118, 'Candidato MG 13', 12345678918, '1986-10-08', 2, 'Feminino', 1, 'Solteiro', 
 1, '123456789029', 'Preta', 7, 3, 4, 5, 6, 7, 8),
(119, 'Candidato MG 14', 12345678919, '1979-03-11', 1, 'Masculino', 4, 'Viúvo', 
 1, '123456789030', 'Amarela', 8, 2, 3, 4, 5, 6, 7),
(120, 'Candidato MG 15', 12345678920, '1998-09-01', 2, 'Feminino', 1, 'Solteiro', 
 1, '123456789031', 'Indígena', 8, 3, 4, 5, 6, 7, 8);




