-- 1. Criar a view vw_media_temperatura_reservatorio
-- O objetivo é calcular a média da temperatura agrupada por reservatório
CREATE VIEW vw_media_temperatura_reservatorio AS
SELECT 
    r.nome AS reservatorio,
    AVG(s.valor) AS media_temperatura
FROM reservatorio r
JOIN serie_temporal s ON s.id_reservatorio = r.id_reservatorio
JOIN parametro p ON p.id_parametro = s.id_parametro
WHERE p.nome_parametro = 'Temperatura'
GROUP BY r.nome;



-- 2. Criar a view vw_eventos_reservatorio
-- Esta view deve listar: nome do reservatório, nome do parâmetro, valor e data/hora.
CREATE VIEW vw_eventos_reservatorio AS
SELECT 
    r.nome AS nome_reservatorio,
    p.nome_parametro,
    s.valor,
    s.data_hora
FROM reservatorio r
JOIN serie_temporal s ON s.id_reservatorio = r.id_reservatorio
JOIN parametro p ON p.id_parametro = s.id_parametro;



-- 3. Criar view para Turbidez acima de 5
-- O exercício pede uma view que mostre apenas reservatórios com média de turbidez acima de 5. Como o nome não foi especificado, usarei vw_alerta_turbidez. Note o uso do HAVING para filtrar a média.

CREATE VIEW vw_alerta_turbidez AS
SELECT 
    r.nome AS reservatorio,
    AVG(s.valor) AS media_turbidez
FROM reservatorio r
JOIN serie_temporal s ON s.id_reservatorio = r.id_reservatorio
JOIN parametro p ON p.id_parametro = s.id_parametro
WHERE p.nome_parametro = 'Turbidez'
GROUP BY r.nome
HAVING AVG(s.valor) > 5;

-- Consultar média de temperatura
SELECT * FROM vw_media_temperatura_reservatorio;

-- Consultar listagem de eventos
SELECT * FROM vw_eventos_reservatorio;

-- Consultar reservatórios com turbidez alta
SELECT * FROM vw_alerta_turbidez;


-- 5. Remover uma view
-- O comando para remover uma view é o DROP VIEW. Exemplo removendo a view de alerta:
DROP VIEW vw_alerta_turbidez;