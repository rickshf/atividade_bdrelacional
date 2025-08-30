-- Contar quantos clientes estão cadastrados no banco.
SELECT COUNT(*) AS total_usuarios FROM Usuario;

-- Contar quantos eventos de cada tipo foram registrados
SELECT
    te.nome,
    COUNT(e.idEvento) AS quantidade_de_eventos
FROM Evento e
JOIN TipoEvento te ON e.idTipoEvento = te.idTipoEvento
GROUP BY te.nome;




-- Contagem Total de Eventos por Status
SELECT
    status,
    COUNT(idEvento) AS total_eventos
FROM
    Evento
GROUP BY
    status
ORDER BY
    total_eventos DESC;

-- Contagem de Eventos por Tipo
SELECT
    te.nome AS tipo_de_evento,
    COUNT(e.idEvento) AS quantidade
FROM
    Evento e
JOIN
    TipoEvento te ON e.idTipoEvento = te.idTipoEvento
GROUP BY
    te.nome
ORDER BY
    quantidade DESC;

-- Cidades com Mais de um Evento Registrado (Uso de HAVING)
SELECT
    l.cidade,
    l.estado,
    COUNT(e.idEvento) AS numero_de_eventos
FROM
    Evento e
JOIN
    Localizacao l ON e.idLocalizacao = l.idLocalizacao
GROUP BY
    l.cidade, l.estado
HAVING
    COUNT(e.idEvento) > 1
ORDER BY
    numero_de_eventos DESC;

--  Número de Eventos 'Ativos' por Tipo
SELECT
    te.nome AS tipo_de_evento,
    COUNT(e.idEvento) AS quantidade_ativos
FROM
    Evento e
JOIN
    TipoEvento te ON e.idTipoEvento = te.idTipoEvento
WHERE
    e.status = 'Ativo'
GROUP BY
    te.nome;

