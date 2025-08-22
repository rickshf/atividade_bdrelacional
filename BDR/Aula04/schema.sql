CREATE DATABASE clima_alerta ENCODING 'UTF8';


-- -----------------------------------------------------
-- 1. Criação dos Tipos Customizados (ENUMs)
-- -----------------------------------------------------

CREATE TYPE status_evento AS ENUM ('Ativo', 'Em Monitoramento', 'Resolvido');
CREATE TYPE nivel_alerta AS ENUM ('Baixo', 'Médio', 'Alto', 'Crítico');


-- -----------------------------------------------------
-- 2. Criação das Tabelas
-- -----------------------------------------------------

-- Tabela: Usuario
-- Armazena os dados dos usuários que podem criar relatos.
CREATE TABLE Usuario (
  idUsuario SERIAL PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senhaHash VARCHAR(255) NOT NULL
);

-- Tabela: TipoEvento
-- Armazena os tipos de eventos climáticos (ex: Queimada, Enchente).
CREATE TABLE TipoEvento (
  idTipoEvento SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT
);

-- Tabela: Localizacao
-- Armazena as informações de geolocalização dos eventos.
CREATE TABLE Localizacao (
  idLocalizacao SERIAL PRIMARY KEY,
  latitude DECIMAL(10, 8) NOT NULL,
  longitude DECIMAL(11, 8) NOT NULL,
  cidade VARCHAR(100),
  estado VARCHAR(50)
);

-- Tabela: Evento
-- Tabela central que registra cada ocorrência de evento climático.
CREATE TABLE Evento (
  idEvento SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  descricao TEXT,
  dataHora TIMESTAMP NOT NULL,
  status status_evento NOT NULL,
  idTipoEvento INT NOT NULL,
  idLocalizacao INT NOT NULL,
  FOREIGN KEY (idTipoEvento) REFERENCES TipoEvento(idTipoEvento) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (idLocalizacao) REFERENCES Localizacao(idLocalizacao) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabela: Relato
-- Armazena relatos enviados por usuários sobre um determinado evento.
CREATE TABLE Relato (
  idRelato SERIAL PRIMARY KEY,
  texto TEXT NOT NULL,
  dataHora TIMESTAMP NOT NULL,
  idEvento INT NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idEvento) REFERENCES Evento(idEvento) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabela: Alerta
-- Armazena os alertas gerados em resposta a um evento.
CREATE TABLE Alerta (
  idAlerta SERIAL PRIMARY KEY,
  mensagem TEXT NOT NULL,
  dataHora TIMESTAMP NOT NULL,
  nivel nivel_alerta NOT NULL,
  idEvento INT NOT NULL,
  FOREIGN KEY (idEvento) REFERENCES Evento(idEvento) ON DELETE CASCADE ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- 3. Criação da Tabela Auxiliar
-- -----------------------------------------------------

-- Tabela: historico_evento
-- Tabela auxiliar para registrar o histórico de mudanças de status de um evento.
CREATE TABLE historico_evento (
    idHistorico SERIAL PRIMARY KEY,
    idEvento INT NOT NULL,
    status_anterior status_evento, -- Pode ser nulo no primeiro registro do evento
    status_novo status_evento NOT NULL,
    data_modificacao TIMESTAMP NOT NULL,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento) ON DELETE CASCADE ON UPDATE CASCADE
);
