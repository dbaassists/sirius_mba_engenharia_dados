use mba;

CREATE TABLE tipo_eleicao (
    id_cd_tipo_eleicao INT PRIMARY KEY,
    nm_tipo_eleicao VARCHAR(100)
);

CREATE TABLE partidos (
    id_nr_partido INT PRIMARY KEY,
    sg_partido VARCHAR(10),
    nm_partido VARCHAR(100)
);

CREATE TABLE cargo (
    id_cd_cargo INT PRIMARY KEY,
    ds_cargo VARCHAR(100)
);

CREATE TABLE situacao_candidatura (
    id_cd_situacao INT PRIMARY KEY,
    ds_situacao VARCHAR(100)
);

CREATE TABLE genero (
    id_cd_genero INT PRIMARY KEY,
    ds_genero VARCHAR(50)
);

CREATE TABLE grau_instrucao (
    id_cd_grau_instrucao INT PRIMARY KEY,
    ds_grau_instrucao VARCHAR(100)
);

CREATE TABLE estado_civil (
    id_cd_estado_civil INT PRIMARY KEY,
    ds_estado_civil VARCHAR(50)
);

CREATE TABLE cor_raca (
    id_cd_cor_raca INT PRIMARY KEY,
    ds_cor_raca VARCHAR(50)
);

CREATE TABLE ocupacao (
    id_cd_ocupacao INT PRIMARY KEY,
    ds_ocupacao VARCHAR(100)
);

CREATE TABLE federacao (
    id_nr_federacao INT PRIMARY KEY,
    nm_federacao VARCHAR(100),
    sg_federacao VARCHAR(10),
    ds_composicao_federacao TEXT
);

CREATE TABLE coligacao (
    id_sq_coligacao INT PRIMARY KEY,
    nm_coligacao VARCHAR(100),
    ds_composicao_coligacao TEXT
);

CREATE TABLE motivo_cassacao (
    id_cd_motivo INT PRIMARY KEY,
    ds_motivo VARCHAR(100),
    tp_motivo VARCHAR(50),
    ds_tp_motivo TEXT
);

CREATE TABLE tipo_bem (
    id_cd_tipo_bem INT PRIMARY KEY,
    ds_tipo_bem VARCHAR(100)
);

CREATE TABLE situacao_totalizacao (
    id_cd_sit_turno INT PRIMARY KEY,
    ds_sit_turno VARCHAR(100)
);

CREATE TABLE situacao_julgamento (
    id_cd_sit_julgamento INT PRIMARY KEY,
    ds_sit_julgamento VARCHAR(100)
);

CREATE TABLE situacao_diploma (
    id_cd_sit_diploma INT PRIMARY KEY,
    ds_sit_diploma VARCHAR(100)
);

-- Tabelas principais
CREATE TABLE eleicoes (
    id_eleicao INT PRIMARY KEY,
    ano_eleicao INT,
    id_cd_tipo_eleicao INT,
    nr_turno INT,
    dt_eleicao DATE,
    tp_abrangencia VARCHAR(50),
    sg_uf VARCHAR(2),
    sg_ue VARCHAR(10),
    nm_ue VARCHAR(100),
    ds_eleicao VARCHAR(200),
    FOREIGN KEY (id_cd_tipo_eleicao) REFERENCES tipo_eleicao(id_cd_tipo_eleicao)
);

CREATE TABLE candidatos (
    id_candidato INT PRIMARY KEY,
    nr_candidato INT,
    nm_candidato VARCHAR(100),
    nm_urna_candidato VARCHAR(100),
    nm_social VARCHAR(100),
    cpf VARCHAR(11),
    email VARCHAR(100),
    tp_agremiacao VARCHAR(50),
    uf_nascimento VARCHAR(2),
    dt_nascimento DATE,
    nr_titulo VARCHAR(12),
    id_cd_genero INT,
    id_cd_grau_instrucao INT,
    id_cd_estado_civil INT,
    id_cd_cor_raca INT,
    id_cd_ocupacao INT,
    id_cd_cargo INT,
    id_nr_partido INT,
    id_nr_federacao INT,
    id_cd_sit_turno INT,
    id_sq_coligacao INT,
    id_cd_motivo INT,
    id_cd_sit_julgamento INT,
    id_cd_sit_diploma INT,
    id_cd_situacao INT,
    FOREIGN KEY (id_cd_genero) REFERENCES genero(id_cd_genero),
    FOREIGN KEY (id_cd_grau_instrucao) REFERENCES grau_instrucao(id_cd_grau_instrucao),
    FOREIGN KEY (id_cd_estado_civil) REFERENCES estado_civil(id_cd_estado_civil),
    FOREIGN KEY (id_cd_cor_raca) REFERENCES cor_raca(id_cd_cor_raca),
    FOREIGN KEY (id_cd_ocupacao) REFERENCES ocupacao(id_cd_ocupacao),
    FOREIGN KEY (id_cd_cargo) REFERENCES cargo(id_cd_cargo),
    FOREIGN KEY (id_nr_partido) REFERENCES partidos(id_nr_partido),
    FOREIGN KEY (id_nr_federacao) REFERENCES federacao(id_nr_federacao),
    FOREIGN KEY (id_cd_sit_turno) REFERENCES situacao_totalizacao(id_cd_sit_turno),
    FOREIGN KEY (id_sq_coligacao) REFERENCES coligacao(id_sq_coligacao),
    FOREIGN KEY (id_cd_motivo) REFERENCES motivo_cassacao(id_cd_motivo),
    FOREIGN KEY (id_cd_sit_julgamento) REFERENCES situacao_julgamento(id_cd_sit_julgamento),
    FOREIGN KEY (id_cd_sit_diploma) REFERENCES situacao_diploma(id_cd_sit_diploma),
    FOREIGN KEY (id_cd_situacao) REFERENCES situacao_candidatura(id_cd_situacao)
);

CREATE TABLE candidato_eleicao (
    id_candidato INT,
    id_eleicao INT,
    PRIMARY KEY (id_candidato, id_eleicao),
    FOREIGN KEY (id_candidato) REFERENCES candidatos(id_candidato),
    FOREIGN KEY (id_eleicao) REFERENCES eleicoes(id_eleicao)
);

CREATE TABLE zona (
    id_cd_zona INT PRIMARY KEY,
    nm_municipio VARCHAR(100),
    cd_municipio INT
);

CREATE TABLE votacao (
    id_cd_votacao INT PRIMARY KEY,
    st_voto_em_transito BOOLEAN,
    qt_votos_nominais INT,
    nm_tipo_destinacao_votos VARCHAR(50),
    qt_votos_nominais_validos INT,
    id_candidato_eleicao INT,
    id_cd_zona INT,
    FOREIGN KEY (id_candidato_eleicao) REFERENCES candidato_eleicao(id_candidato),
    FOREIGN KEY (id_cd_zona) REFERENCES zona(id_cd_zona)
);

CREATE TABLE rede_social (
    id_rede_social INT PRIMARY KEY,
    ordem_rede_social INT,
    ds_url VARCHAR(200),
    id_candidato INT,
    FOREIGN KEY (id_candidato) REFERENCES candidatos(id_candidato)
);

CREATE TABLE bem_candidato (
    id_bem_candidato INT PRIMARY KEY,
    nr_ordem_bem_candidato INT,
    vr_bem_candidato DECIMAL(15, 2),
    ds_bem_candidato VARCHAR(100),
    dt_hh_ultima_att TIMESTAMP,
    id_cd_tipo_bem INT,
    id_candidato INT,
    FOREIGN KEY (id_cd_tipo_bem) REFERENCES tipo_bem(id_cd_tipo_bem),
    FOREIGN KEY (id_candidato) REFERENCES candidatos(id_candidato)
);
