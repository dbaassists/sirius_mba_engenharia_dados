USE snowflake;

-- Tabelas de Dimensão
CREATE TABLE dim_candidato (
    id_candidato INT PRIMARY KEY,
    nr_candidato INT,
    nm_candidato VARCHAR(100),
    nm_social VARCHAR(100),
    nm_urna_candidato VARCHAR(100),
    cpf CHAR(11),
    email VARCHAR(100),
    uf CHAR(2),
    dt_nascimento DATE,
    nr_titulo CHAR(12),
    cd_genero INT,
    ds_genero VARCHAR(50),
    cd_grau_instrucao INT,
    ds_grau_instrucao VARCHAR(100),
    cd_estado_civil INT,
    ds_estado_civil VARCHAR(50),
    cd_cor_raca INT,
    ds_cor_raca VARCHAR(50),
    cd_ocupacao INT,
    ds_ocupacao VARCHAR(100),
    cd_cargo INT,
    ds_cargo VARCHAR(100),
    nr_partido INT,
    sg_partido CHAR(5),
    nm_partido VARCHAR(100),
    nr_federacao INT,
    nm_federacao VARCHAR(100),
    sg_federacao CHAR(5),
    ds_composicao_federacao VARCHAR(255),
    sq_coligacao INT,
    nm_coligacao VARCHAR(100),
    ds_composicao_coligacao VARCHAR(255)
);

CREATE TABLE dim_bem (
    id_bem INT PRIMARY KEY,
    nr_ordem_bem_candidato INT,
    ds_bem_candidato VARCHAR(255),
    vr_bem_candidato DECIMAL(18, 2),
    dt_hh_ultima_att TIMESTAMP,
    cd_tipo_bem INT,
    ds_tipo_bem VARCHAR(100),
    id_candidato INT,
    FOREIGN KEY (id_candidato) REFERENCES dim_candidato(id_candidato)
);

CREATE TABLE dim_rede (
    id_rede INT PRIMARY KEY,
    id_candidato INT,
    ordem_rede INT,
    ds_url VARCHAR(100),
    FOREIGN KEY (id_candidato) REFERENCES dim_candidato(id_candidato)
);

CREATE TABLE dim_motivo (
    id_cd_motivo INT PRIMARY KEY,
    ds_motivo VARCHAR(255),
    tp_motivo VARCHAR(50),
    ds_tp_motivo VARCHAR(100),
    id_candidato INT,
    FOREIGN KEY (id_candidato) REFERENCES dim_candidato(id_candidato)
);

CREATE TABLE dim_eleicao (
    id_eleicao INT PRIMARY KEY,
    cd_tipo_eleicao INT,
    nr_turno INT,
    dt_eleicao DATE,
    tp_abrangencia VARCHAR(50),
    sg_uf CHAR(2),
    sg_ue CHAR(2),
    nm_ue VARCHAR(50),
    ds_eleicao VARCHAR(255),
    ano_eleicao INT
);

CREATE TABLE dim_zona (
    cd_zona INT PRIMARY KEY,
    nm_municipio VARCHAR(100),
    cd_municipio INT
);

-- Tabela de Fato
CREATE TABLE fato_votacao (
    id_fato_votacao INT PRIMARY KEY,
    id_candidato INT,
    id_eleicao INT,
    id_zona INT,
    id_data INT,
    qt_votos_nominais INT,
    qt_votos_nominais_validos INT,
    FOREIGN KEY (id_candidato) REFERENCES dim_candidato(id_candidato),
    FOREIGN KEY (id_eleicao) REFERENCES dim_eleicao(id_eleicao),
    FOREIGN KEY (id_zona) REFERENCES dim_zona(cd_zona)
);