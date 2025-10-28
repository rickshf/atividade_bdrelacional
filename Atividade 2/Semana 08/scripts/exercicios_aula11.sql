-- /scripts/exercicios_aula11.sql

-- Exercício 1 (BD Biblioteca): Listar quantos livros cada autor possui.
-- Esta consulta junta as tabelas 'autor' e 'livro', conta o número de livros (l.id_livro)
-- para cada autor e agrupa o resultado pelo nome do autor.
SELECT
  a.nome AS autor,
  COUNT(l.id_livro) AS total_livros
FROM autor AS a
LEFT JOIN livro AS l
  ON a.id_autor = l.id_autor
GROUP BY
  a.nome
ORDER BY
  total_livros DESC;

-- Exercício 2 (BD Biblioteca): Mostrar a média de páginas dos livros por editora.
-- Nota: O esquema apresentado não inclui tabelas 'editora' ou coluna 'paginas'.
-- A consulta abaixo é um exemplo hipotético de como seria a solução.
-- Ela calcularia a média de páginas (paginas) para cada editora (e.nome),
-- agrupando os resultados pelo nome da editora.
/*
SELECT
  e.nome AS editora,
  AVG(l.paginas) AS media_de_paginas
FROM livro AS l
INNER JOIN editora AS e
  ON l.id_editora = e.id_editora
GROUP BY
  e.nome;
*/

-- Exercício 3 (limnologia_db): Listar o total de campanhas por reservatório.
-- Esta consulta une as tabelas 'reservatorio' e 'campanha' e conta
-- o número de campanhas (c.id_campanha) para cada reservatório,
-- agrupando o resultado pelo nome do reservatório.
SELECT
  r.nome AS reservatorio,
  COUNT(c.id_campanha) AS total_campanhas
FROM reservatorio AS r
INNER JOIN campanha AS c
  ON r.id_reservatorio = c.id_reservatorio
GROUP BY
  r.nome
ORDER BY
  total_campanhas DESC;

-- Exercício 4 (limnologia_db): Mostrar a média de valores de cada parâmetro em séries temporais.
-- Nota: O esquema para esta consulta não foi totalmente detalhado.
-- A consulta abaixo é um exemplo hipotético. Ela uniria as tabelas 'serie_temporal_valores'
-- e 'parametro' para calcular o valor médio (stv.valor) de cada parâmetro (p.nome),
-- agrupando os dados pelo nome do parâmetro.
/*
SELECT
  p.nome AS parametro,
  AVG(stv.valor) AS media_dos_valores
FROM serie_temporal_valores AS stv
INNER JOIN parametro AS p
  ON stv.id_parametro = p.id_parametro
GROUP BY
  p.nome;
*/


-- Exercício 5 (limnologia_db): Exibir apenas as instituições que realizaram mais de 3 campanhas.
-- Esta consulta junta as tabelas 'instituicao' e 'campanha', conta o número de campanhas
-- por instituição e utiliza a cláusula HAVING para filtrar e mostrar
-- apenas as instituições com um total de campanhas superior a 3.
SELECT
  i.nome AS instituicao,
  COUNT(c.id_campanha) AS total_campanhas
FROM instituicao AS i
INNER JOIN campanha AS c
  ON i.id_instituicao = c.id_instituicao
GROUP BY
  i.nome
HAVING
  COUNT(c.id_campanha) > 3;