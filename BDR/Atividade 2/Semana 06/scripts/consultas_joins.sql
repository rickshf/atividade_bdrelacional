-- Consulta A: Retorna o título do evento e o nome do tipo de evento.
-- Utiliza-se INNER JOIN para combinar as tabelas 'evento' e 'tipo_evento'
-- onde há uma correspondência de 'id_tipo_evento' em ambas.
SELECT
  e.titulo AS evento,
  te.nome AS tipo_evento
FROM evento AS e
INNER JOIN tipo_evento AS te
  ON e.id_tipo_evento = te.id_tipo_evento;

-- Consulta B: Retorna o título do evento, a cidade e a sigla do estado.
-- O INNER JOIN é usado para conectar as tabelas 'evento' e 'localizacao'
-- através da chave estrangeira 'id_localizacao'.
SELECT
  e.titulo AS evento,
  l.cidade,
  l.sigla_estado
FROM evento AS e
INNER JOIN localizacao AS l
  ON e.id_localizacao = l.id_localizacao;

-- Consulta C: Retorna o título do evento, o tipo de evento e a cidade.
-- Inclui eventos que podem não ter uma localização associada.
-- O LEFT JOIN é escolhido para garantir que todos os registros da tabela 'evento' (à esquerda)
-- sejam retornados, mesmo que não haja uma correspondência na tabela 'localizacao'.
-- Se um evento não tiver localização, os campos 'cidade' e 'sigla_estado' aparecerão como NULL.
SELECT
  e.titulo AS evento,
  te.nome AS tipo_evento,
  l.cidade
FROM evento AS e
INNER JOIN tipo_evento AS te
  ON e.id_tipo_evento = te.id_tipo_evento
LEFT JOIN localizacao AS l
  ON e.id_localizacao = l.id_localizacao;

-- Consulta D: Reescreve a Consulta B usando RIGHT JOIN.
-- O resultado é o mesmo da Consulta B, mas a ordem das tabelas na cláusula FROM é invertida.
-- O RIGHT JOIN garante que todos os registros da tabela 'evento' (à direita) sejam incluídos.
-- Em termos de legibilidade, o LEFT JOIN é frequentemente preferido por seguir uma lógica
-- mais natural de leitura (da esquerda para a direita), partindo da tabela principal da consulta.
SELECT
  e.titulo AS evento,
  l.cidade,
  l.sigla_estado
FROM localizacao AS l
RIGHT JOIN evento AS e
  ON l.id_localizacao = e.id_localizacao;

-- Consulta E: Mostra a quantidade de eventos por cidade.
-- O INNER JOIN conecta 'evento' e 'localizacao'.
-- O GROUP BY agrupa os resultados por cidade e estado.
-- A função de agregação COUNT(e.id_evento) conta o número de eventos em cada grupo.
SELECT
  l.cidade,
  l.sigla_estado,
  COUNT(e.id_evento) AS quantidade_de_eventos
FROM evento AS e
INNER JOIN localizacao AS l
  ON e.id_localizacao = l.id_localizacao
GROUP BY
  l.cidade,
  l.sigla_estado;