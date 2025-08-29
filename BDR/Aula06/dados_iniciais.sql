-- -----------------------------------------------------
-- SCRIPT DE CARGA INICIAL E EXERCÍCIOS
-- Projeto: clima_alerta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Seção 1: Inserção de Dados Base (Tabelas sem dependências)
-- -----------------------------------------------------

-- Inserindo 3 tipos de evento
INSERT INTO TipoEvento (nome, descricao) VALUES
('Queimada', 'Incêndio em área de vegetação ou urbana'),
('Enchente', 'Alagamentos por chuvas intensas ou transbordo'),
('Deslizamento', 'Movimento de massa em encostas');

-- Inserindo 3 usuários
INSERT INTO Usuario (nome, email, senhaHash) VALUES
('Maria Oliveira', 'maria.oliveira@email.com', 'hash$1'),
('João Souza', 'joao.souza@email.com', 'hash$2'),
('Ana Lima', 'ana.lima@email.com', 'hash$3');

-- -----------------------------------------------------
-- Seção 2: Inserção de Dados (Tabelas com dependências)
-- -----------------------------------------------------

-- Inserindo 3 localizações
INSERT INTO Localizacao (latitude, longitude, cidade, estado) VALUES
(-23.305000, -45.965000, 'Jacareí', 'SP'),
(-22.785000, -43.304000, 'Duque de Caxias', 'RJ'),
(-19.924500, -43.935200, 'Belo Horizonte', 'MG');

-- Inserindo os 3 eventos iniciais da aula
-- Evento 1
INSERT INTO Evento (titulo, descricao, dataHora, status, idTipoEvento, idLocalizacao)
VALUES (
    'Queimada em área de preservação',
    'Foco de incêndio próximo à represa municipal.',
    '2025-08-15 14:35:00',
    'Ativo',
    (SELECT idTipoEvento FROM TipoEvento WHERE nome = 'Queimada'),
    (SELECT idLocalizacao FROM Localizacao WHERE cidade = 'Jacareí' AND estado = 'SP')
);

-- Evento 2
INSERT INTO Evento (titulo, descricao, dataHora, status, idTipoEvento, idLocalizacao)
VALUES (
    'Enchente em bairro central',
    'Rua principal alagada; trânsito interrompido.',
    '2025-08-16 09:10:00',
    'Em Monitoramento',
    (SELECT idTipoEvento FROM TipoEvento WHERE nome = 'Enchente'),
    (SELECT idLocalizacao FROM Localizacao WHERE cidade = 'Duque de Caxias' AND estado = 'RJ')
);

-- Evento 3
INSERT INTO Evento (titulo, descricao, dataHora, status, idTipoEvento, idLocalizacao)
VALUES (
    'Deslizamento em encosta',
    'Queda de barreira após chuva intensa.',
    '2025-08-17 07:50:00',
    'Resolvido',
    (SELECT idTipoEvento FROM TipoEvento WHERE nome = 'Deslizamento'),
    (SELECT idLocalizacao FROM Localizacao WHERE cidade = 'Belo Horizonte' AND estado = 'MG')
);

-- -----------------------------------------------------
-- Seção 3: Continuação dos Exercícios (Inserções Adicionais)
-- -----------------------------------------------------

-- Evento 4
INSERT INTO Evento (titulo, descricao, dataHora, status, idTipoEvento, idLocalizacao)
VALUES (
    'Alerta de Deslizamento em Encosta',
    'Pequeno movimento de terra registrado na área residencial após chuvas.',
    '2025-08-18 11:20:00',
    'Em Monitoramento',
    (SELECT idTipoEvento FROM TipoEvento WHERE nome = 'Deslizamento'),
    (SELECT idLocalizacao FROM Localizacao WHERE cidade = 'Duque de Caxias' AND estado = 'RJ')
);

-- Evento 5
INSERT INTO Evento (titulo, descricao, dataHora, status, idTipoEvento, idLocalizacao)
VALUES (
    'Foco de Queimada em Parque Estadual',
    'Fumaça densa avistada por moradores próximos ao parque.',
    '2025-08-19 16:45:00',
    'Ativo',
    (SELECT idTipoEvento FROM TipoEvento WHERE nome = 'Queimada'),
    (SELECT idLocalizacao FROM Localizacao WHERE cidade = 'Belo Horizonte' AND estado = 'MG')
);

-- -----------------------------------------------------
-- Seção 4: Consultas de Verificação e Exercícios
-- -----------------------------------------------------

-- Listar usuários
SELECT idUsuario, nome, email FROM Usuario;

-- Listar tipos de evento
SELECT idTipoEvento, nome, descricao FROM TipoEvento;

-- Eventos filtrados por status 'Ativo'
SELECT idEvento, titulo, status, dataHora
FROM Evento
WHERE status = 'Ativo';

-- Localizações apenas do estado de SP
SELECT idLocalizacao, cidade, estado
FROM Localizacao
WHERE estado = 'SP';

-- Consulta ordenada por data (exercício)
SELECT titulo, status, dataHora
FROM Evento
ORDER BY dataHora DESC;

-- Consulta ordenada e limitada aos 3 eventos mais recentes (exercício)
SELECT titulo, status, dataHora
FROM Evento
ORDER BY dataHora DESC
LIMIT 3;

-- Consultas de contagem para conferência rápida
SELECT COUNT(*) AS total_tipo_evento FROM TipoEvento;
SELECT COUNT(*) AS total_usuario FROM Usuario;
SELECT COUNT(*) AS total_localizacao FROM Localizacao;
SELECT COUNT(*) AS total_evento FROM Evento;
