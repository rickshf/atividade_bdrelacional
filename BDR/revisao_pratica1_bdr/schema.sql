-- Questão 1: Criação do banco de dados
-- CREATE DATABASE rede_games;

-- Conecte-se ao banco de dados rede_games antes de executar os comandos abaixo.
-- \c rede_games

-- Questão 2: Criação das tabelas

-- Tabela de lojas
CREATE TABLE loja (
    id_loja SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    cidade VARCHAR(255)
);

-- Tabela de clientes
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cidade VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela de jogos
CREATE TABLE jogo (
    id_jogo SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano_lancamento INT,
    genero VARCHAR(100)
);

-- Tabela de compras
CREATE TABLE compra (
    id_compra SERIAL PRIMARY KEY,
    data_compra DATE NOT NULL,
    id_cliente INT REFERENCES cliente(id_cliente),
    id_loja INT REFERENCES loja(id_loja)
);

-- Tabela associativa compra_jogo
CREATE TABLE compra_jogo (
    id_compra INT REFERENCES compra(id_compra),
    id_jogo INT REFERENCES jogo(id_jogo),
    quantidade INT NOT NULL,
    PRIMARY KEY (id_compra, id_jogo)
);
