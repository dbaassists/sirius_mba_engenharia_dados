# Volumetria

'''
INT - 4 bytes
DATE - 3 bytes
VARCHAR e CHAR é o tamanho dos mesmos, tipo VARCHAR(100) - 100.
'''


'''
CREATE TABLE bem_candidato (
  sq_bem_candidato INT PRIMARY KEY,
  sq_candidato INT,
  ordem_bem_candidato INT,
  sq_tipo_bem INT,
  descricao_bem VARCHAR(100),
  valor_bem DECIMAL,
  data_ultima_atualizacao DATE,
  hora_ultima_atualizacao TIME,
  PRIMARY KEY (sq_bem_candidato)
);

CREATE TABLE motivo (
  sq_motivo INT PRIMARY KEY,
  descricao_motivo VARCHAR(100),
  PRIMARY KEY (sq_motivo)
);

CREATE TABLE situacao_cassacao (
  sq_situacao_cassacao INT PRIMARY KEY,
  descricao VARCHAR(15),
  PRIMARY KEY (sq_situacao_cassacao)
);

CREATE TABLE votacao_candidato (
  sq_votacao_candidato INT PRIMARY KEY,
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
  PRIMARY KEY (sq_votacao_candidato),
  FOREIGN KEY (sq_situacao_cassacao) REFERENCES situacao_cassacao(sq_situacao_cassacao)
);

CREATE TABLE cargo (
  sq_cargo INT PRIMARY KEY,
  descricao VARCHAR(50),
  PRIMARY KEY (sq_cargo),
  FOREIGN KEY (descricao) REFERENCES votacao_candidato(sq_cargo)
);

CREATE TABLE estado_civil (
  sq_estado_civil INT PRIMARY KEY,
  descricao VARCHAR(25),
  PRIMARY KEY (sq_estado_civil)
);

CREATE TABLE situacao_detalhe (
  sq_situacao_detalhe INT PRIMARY KEY,
  sq_situacao_candidatura INT,
  descricao VARCHAR(15),
  PRIMARY KEY (sq_situacao_detalhe)
);

CREATE TABLE tipo_eleicao (
  sq_tipo_eleicao INT PRIMARY KEY,
  descricao VARCHAR(50),
  PRIMARY KEY (sq_tipo_eleicao)
);

CREATE TABLE genero (
  sq_genero INT PRIMARY KEY,
  descricao VARCHAR(20),
  PRIMARY KEY (sq_genero)
);

CREATE TABLE federacao (
  sq_federacao INT PRIMARY KEY,
  sigla VARCHAR(20),
  nome VARCHAR(50),
  composicao VARCHAR(20),
  PRIMARY KEY (sq_federacao)
);

CREATE TABLE candidato_eleicao (
  sq_candidato_eleicao INT PRIMARY KEY,
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
  situacao candidatura INT,
  votacao_candidato INT,
  motivo_cassacao INT,
  turno INT,
  cargo INT,
  abrangencia VARCHAR(50),
  sq_federacao INT,
  nome_ue VARCHAR(50),
  tipo_eleicao INT,
  PRIMARY KEY (sq_candidato_eleicao),
  FOREIGN KEY (sq_federacao) REFERENCES federacao(sq_federacao)
);

CREATE TABLE ocupacao (
  sq_ocupacao INT PRIMARY KEY,
  descricao VARCHAR(50),
  PRIMARY KEY (sq_ocupacao),
  FOREIGN KEY (sq_ocupacao) REFERENCES candidato_eleicao(sq_ocupacao)
);

CREATE TABLE coligacao (
  sq_coligacao INT PRIMARY KEY,
  nome VARCHAR(200),
  composicao VARCHAR(200),
  PRIMARY KEY (sq_coligacao)
);

CREATE TABLE coligacao (
  sq_coligacao INT PRIMARY KEY,
  nome VARCHAR(200),
  composicao VARCHAR(200),
  PRIMARY KEY (sq_coligacao)
);

CREATE TABLE partido (
  sq_partido INT PRIMARY KEY,
  sigla VARCHAR(15),
  nome VARCHAR(50),
  PRIMARY KEY (sq_partido)
);

CREATE TABLE situacao_diploma (
  sq_situacao_diploma INT PRIMARY KEY,
  descricao VARCHAR(15),
  PRIMARY KEY (sq_situacao_diploma)
);

CREATE TABLE rede_social (
  sq_rede_social INT PRIMARY KEY,
  ano_eleicao INT,
  sq_candidato INT,
  uf CHAR(2),
  data_ultima_atualizacao DATE,
  ordem_rede_social INT,
  url VARCHAR(200),
  PRIMARY KEY (sq_rede_social)
);

CREATE TABLE municipio (
  sq_municipio INT PRIMARY KEY,
  nome VARCHAR(30),
  PRIMARY KEY (sq_municipio),
  FOREIGN KEY (nome) REFERENCES votacao_candidato(sq_municipio)
);

CREATE TABLE cor_raca (
  sq_cor_raca INT PRIMARY KEY,
  descricao VARCHAR(15),
  PRIMARY KEY (sq_cor_raca)
);

CREATE TABLE situacao_candidatura (
  sq_situacao_candidatura INT PRIMARY KEY,
  descricao VARCHAR(20),
  PRIMARY KEY (sq_situacao_candidatura)
);

CREATE TABLE tipo_bem (
  sq_tipo_bem INT PRIMARY KEY,
  descricao VARCHAR(100),
  PRIMARY KEY (sq_tipo_bem)
);

CREATE TABLE zona (
  sq_zona INT PRIMARY KEY,
  sq_municipio INT,
  PRIMARY KEY (sq_zona),
  FOREIGN KEY (sq_municipio) REFERENCES votacao_candidato(sq_zona)
);

CREATE TABLE situacao_julgamento (
  sq_situacao_julgamento INT PRIMARY KEY,
  descricao VARCHAR(25),
  PRIMARY KEY (sq_situacao_julgamento)
);

CREATE TABLE cargo (
  sq_cargo INT PRIMARY KEY,
  descricao VARCHAR(50),
  PRIMARY KEY (sq_cargo)
);

CREATE TABLE motivo_cassacao (
  sq_motivo_cassacao INT PRIMARY KEY,
  sq_eleicao INT,
  sq_candidato INT,
  tipo_motivo CHAR(1),
  sq_motivo INT,
  descricao_tipo_motivo VARCHAR(50),
  PRIMARY KEY (sq_motivo_cassacao)
);

CREATE TABLE grau_instrucao (
  sq_grau_instrucao INT PRIMARY KEY,
  descricao VARCHAR(20),
  PRIMARY KEY (sq_grau_instrucao)
);
'''