-- Tabelas principais

CREATE TABLE candidato_eleicao (
    sq_candidato_eleicao INT PRIMARY KEY AUTO_INCREMENT,
    numero_candidato INT,
    nome_completo VARCHAR(200),
    nome_urna VARCHAR(100),
    nome_social VARCHAR(100),
    cpf CHAR(12),
    email VARCHAR(50),
    sq_partido INT,
    sq_coligacao INT,
    sq_genero INT,
    sq_grau_instrucao INT,
    sq_estado_civil INT,
    sq_cor_raca INT,
    sq_ocupacao INT,
    sq_motivo_cassacao INT,
    sq_bem_candidato INT,
    tipo_agremiacao VARCHAR(20),
    uf CHAR(2),
    uf_nascimento CHAR(2),
    data_nascimento DATE,
    titulo_eleitoral CHAR(12),
    rede_social INT,
    situacao_candidatura INT,
    votacao_candidato INT,
    turno INT,
    cargo INT,
    abrangencia VARCHAR(50),
    sq_federacao INT,
    nome_ue VARCHAR(50),
    tipo_eleicao INT,
    FOREIGN KEY (sq_partido) REFERENCES partido(sq_partido),
    FOREIGN KEY (sq_coligacao) REFERENCES coligacao(sq_coligacao),
    FOREIGN KEY (sq_genero) REFERENCES genero(sq_genero),
    FOREIGN KEY (sq_grau_instrucao) REFERENCES grau_instrucao(sq_grau_instrucao),
    FOREIGN KEY (sq_estado_civil) REFERENCES estado_civil(sq_estado_civil),
    FOREIGN KEY (sq_cor_raca) REFERENCES cor_raca(sq_cor_raca),
    FOREIGN KEY (sq_ocupacao) REFERENCES ocupacao(sq_ocupacao),
    FOREIGN KEY (sq_motivo_cassacao) REFERENCES motivo_cassacao(sq_motivo_cassacao),
    FOREIGN KEY (sq_bem_candidato) REFERENCES bem_candidato(sq_bem_candidato),
    FOREIGN KEY (rede_social) REFERENCES rede_social(sq_rede_social),
    FOREIGN KEY (situacao_candidatura) REFERENCES situacao_candidatura(sq_situacao_candidatura),
    FOREIGN KEY (cargo) REFERENCES cargo(sq_cargo),
    FOREIGN KEY (sq_federacao) REFERENCES federacao(sq_federacao),
    FOREIGN KEY (tipo_eleicao) REFERENCES tipo_eleicao(sq_tipo_eleicao)
);

CREATE TABLE votacao_candidato (
    sq_votacao_candidato INT PRIMARY KEY AUTO_INCREMENT,
    sq_tipo_eleicao INT,
    sq_municipio INT,
    sq_zona INT,
    sq_cargo INT,
    sq_candidato_eleicao INT,
    sq_partido INT,
    sq_situacao_detalhe INT,
    sq_situacao_julgamento INT,
    sq_situacao_cassacao INT,
    sq_situacao_diploma INT,
    tipo_agremiacao VARCHAR(15),
    sq_federacao INT,
    sq_coligacao INT,
    voto_em_transito INT,
    quantidade_voto_nominal INT,
    tipo_destinacao_voto VARCHAR(20),
    quantidade_voto_nominal_valido INT,
    sq_situacao_candidatura INT,
    FOREIGN KEY (sq_tipo_eleicao) REFERENCES tipo_eleicao(sq_tipo_eleicao),
    FOREIGN KEY (sq_municipio) REFERENCES municipio(sq_municipio),
    FOREIGN KEY (sq_zona) REFERENCES zona(sq_zona),
    FOREIGN KEY (sq_cargo) REFERENCES cargo(sq_cargo),
    FOREIGN KEY (sq_candidato_eleicao) REFERENCES candidato_eleicao(sq_candidato_eleicao),
    FOREIGN KEY (sq_partido) REFERENCES partido(sq_partido),
    FOREIGN KEY (sq_situacao_detalhe) REFERENCES situacao_detalhe(sq_situacao_detalhe),
    FOREIGN KEY (sq_situacao_julgamento) REFERENCES situacao_julgamento(sq_situacao_julgamento),
    FOREIGN KEY (sq_situacao_cassacao) REFERENCES situacao_cassacao(sq_situacao_cassacao),
    FOREIGN KEY (sq_situacao_diploma) REFERENCES situacao_diploma(sq_situacao_diploma),
    FOREIGN KEY (sq_federacao) REFERENCES federacao(sq_federacao),
    FOREIGN KEY (sq_coligacao) REFERENCES coligacao(sq_coligacao),
    FOREIGN KEY (sq_situacao_candidatura) REFERENCES situacao_candidatura(sq_situacao_candidatura)
);

-- Tabelas de apoio

CREATE TABLE situacao_cassacao (
    sq_situacao_cassacao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(15)
);

CREATE TABLE situacao_detalhe (
    sq_situacao_detalhe INT PRIMARY KEY AUTO_INCREMENT,
    sq_situacao_candidatura INT,
    descricao VARCHAR(15),
    FOREIGN KEY (sq_situacao_candidatura) REFERENCES situacao_candidatura(sq_situacao_candidatura)
);

CREATE TABLE situacao_julgamento (
    sq_situacao_julgamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(25)
);

CREATE TABLE zona (
    sq_zona INT PRIMARY KEY AUTO_INCREMENT,
    sq_municipio INT,
    FOREIGN KEY (sq_municipio) REFERENCES municipio(sq_municipio)
);

CREATE TABLE municipio (
    sq_municipio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30)
);

CREATE TABLE cargo (
    sq_cargo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50)
);

CREATE TABLE federacao (
    sq_federacao INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(20),
    nome VARCHAR(50),
    composicao VARCHAR(20)
);

CREATE TABLE coligacao (
    sq_coligacao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200),
    composicao VARCHAR(200)
);

CREATE TABLE partido (
    sq_partido INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(15),
    nome VARCHAR(50)
);

CREATE TABLE cor_raca (
    sq_cor_raca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(15)
);

CREATE TABLE tipo_eleicao (
    sq_tipo_eleicao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50)
);

CREATE TABLE rede_social (
    sq_rede_social INT PRIMARY KEY AUTO_INCREMENT,
    ano_eleicao INT,
    sq_candidato INT,
    uf CHAR(2),
    data_ultima_atualizacao DATE,
    ordem_rede_social INT,
    url VARCHAR(200),
    FOREIGN KEY (sq_candidato) REFERENCES candidato_eleicao(sq_candidato_eleicao)
);

CREATE TABLE bem_candidato (
    sq_bem_candidato INT PRIMARY KEY AUTO_INCREMENT,
    sq_candidato INT,
    ordem_bem_candidato INT,
    sq_tipo_bem INT,
    descricao_bem VARCHAR(100),
    valor_bem DECIMAL,
    data_ultima_atualizacao DATE,
    hora_ultima_atualizacao TIME,
    FOREIGN KEY (sq_candidato) REFERENCES candidato_eleicao(sq_candidato_eleicao),
    FOREIGN KEY (sq_tipo_bem) REFERENCES tipo_bem(sq_tipo_bem)
);

CREATE TABLE tipo_bem (
    sq_tipo_bem INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100)
);

CREATE TABLE situacao_diploma (
    sq_situacao_diploma INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(15)
);

CREATE TABLE ocupacao (
    sq_ocupacao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50)
);

CREATE TABLE grau_instrucao (
    sq_grau_instrucao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20)
);

CREATE TABLE genero (
    sq_genero INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20)
);

CREATE TABLE estado_civil (
    sq_estado_civil INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(25)
);

CREATE TABLE situacao_candidatura (
    sq_situacao_candidatura INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20)
);

CREATE TABLE motivo (
    sq_motivo INT PRIMARY KEY AUTO_INCREMENT,
    descricao_motivo VARCHAR(100)
);

CREATE TABLE motivo_cassacao (
    sq_motivo_cassacao INT PRIMARY KEY AUTO_INCREMENT,
    sq_eleicao INT,
    sq_candidato INT,
    tipo_motivo CHAR(1),
    sq_motivo INT,
    descricao_tipo_motivo VARCHAR(50),
    FOREIGN KEY (sq_eleicao) REFERENCES tipo_eleicao(sq_tipo_eleicao),
    FOREIGN KEY (sq_candidato) REFERENCES candidato_eleicao(sq_candidato_eleicao),
    FOREIGN KEY (sq_motivo) REFERENCES motivo(sq_motivo)
);
