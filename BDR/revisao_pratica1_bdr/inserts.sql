-- Questão 3: Inserção de dados iniciais de lojas

INSERT INTO loja (nome, email, cidade) VALUES
('Game Mania', 'contato@gamemania.com', 'São Paulo'),
('Player Point', 'vendas@playerpoint.com.br', 'Rio de Janeiro'),
('E-Sports Arena', 'suporte@esportsarena.com', 'Belo Horizonte');


INSERT INTO loja (nome, email, cidade) VALUES
('Nexus Games', 'contato@nexusgames.com', 'Campinas'),
('Player 1 Start', 'atendimento@p1start.com', 'Santos');

-- Questão 4: Inserção de clientes

INSERT INTO cliente (nome, cidade, email) VALUES
('Carlos Silva', 'São Paulo', 'carlos.silva@email.com'),
('Mariana Santos', 'Rio de Janeiro', 'mariana.santos@email.com'),
('Pedro Almeida', 'Curitiba', 'pedro.almeida@email.com');


INSERT INTO cliente (nome, cidade, email) VALUES
('Ana Julia', 'Campinas', 'ana.julia@email.com'),
('Lucas Pereira', 'Santos', 'lucas.p@email.com'),
('Beatriz Costa', 'São Paulo', 'beatriz.c@email.com'),
('Rafael Oliveira', 'Belo Horizonte', 'rafael.o@email.com');

-- Questão 5: Inserção de jogos

INSERT INTO jogo (titulo, ano_lancamento, genero) VALUES
('Cyber Guardian', 2022, 'Ação/RPG'),
('Starfall', 2019, 'Estratégia'),
('Cosmic Drift', 2023, 'Corrida');


INSERT INTO jogo (titulo, ano_lancamento, genero) VALUES
('Legends of Ethera', 2021, 'Fantasia/RPG'),
('Quantum Racer', 2024, 'Corrida Futurista'),
('Galactic Frontier', 2018, 'Simulação Espacial'),
('Mystic Forest', 2022, 'Aventura/Puzzle'),
('Urban Combat 5', 2023, 'FPS');


-- Questão 6: Registro de compras

INSERT INTO compra (data_compra, id_cliente, id_loja) VALUES
('2025-09-01', 1, 1), -- Carlos na Game Mania
('2025-09-03', 2, 2); -- Mariana na Player Point

INSERT INTO compra (data_compra, id_cliente, id_loja) VALUES
('2025-09-04', 3, 3),
('2025-09-05', 4, 4),
('2025-09-06', 1, 1);

-- Questão 7: Registro de jogos nas compras

INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(1, 1, 1),
(1, 3, 1);


INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(2, 2, 2),
(2, 3, 1);


INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(3, 2, 1),
(3, 6, 1);


INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(4, 4, 1),
(4, 5, 1),
(4, 8, 1);


INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(5, 1, 1),
(5, 7, 2);
