-- Passo 1: Conferir os parâmetros disponíveis
SELECT * FROM parametro;

-- Passo 2: Subconsulta isolada que retorna a lista de IDs de reservatórios
SELECT s.id_reservatorio
FROM serie_temporal s
INNER JOIN parametro p ON s.id_parametro = p.id_parametro
WHERE p.nome_parametro = 'Oxigênio Dissolvido';

-- Passo 3: Query completa utilizando a subconsulta com o operador IN
SELECT r.nome AS "Reservatório"
FROM reservatorio r
WHERE r.id_reservatorio IN (
    SELECT s.id_reservatorio
    FROM serie_temporal s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE p.nome_parametro = 'Oxigênio Dissolvido'
);

-- Passo 4: Reescrevendo a consulta com o operador EXISTS
SELECT r.nome AS "Reservatório"
FROM reservatorio r
WHERE EXISTS (
    SELECT 1
    FROM serie_temporal s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE s.id_reservatorio = r.id_reservatorio
      AND p.nome_parametro = 'Oxigênio Dissolvido'
);


-- Passo 5: Análise de desempenho da consulta com IN
EXPLAIN ANALYZE
SELECT r.nome AS "Reservatório"
FROM reservatorio r
WHERE r.id_reservatorio IN (
    SELECT s.id_reservatorio
    FROM serie_temporal s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE p.nome_parametro = 'Oxigênio Dissolvido'
);

-- Passo 5: Análise de desempenho da consulta com EXISTS
EXPLAIN ANALYZE
SELECT r.nome AS "Reservatório"
FROM reservatorio r
WHERE EXISTS (
    SELECT 1
    FROM serie_temporal s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE s.id_reservatorio = r.id_reservatorio
      AND p.nome_parametro = 'Oxigênio Dissolvido'
);