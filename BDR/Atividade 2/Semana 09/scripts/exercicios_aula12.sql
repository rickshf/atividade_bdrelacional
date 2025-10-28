-- /scripts/exercicios_aula12.sql

-- Exercício 1 (BD Biblioteca): Listar quantos livros cada autor publicou por editora.
-- Esta consulta junta as tabelas de autor, livro e editora para contar o
[cite_start]-- número de livros que cada autor publicou em cada editora. [cite: 798, 799, 800, 801, 802, 803]
-- O resultado é agrupado pelo nome do autor e da editora.
SELECT
  a.nome AS autor,
  e.nome AS editora,
  COUNT(l.id_livro) AS total_livros
FROM autor AS a
INNER JOIN livro AS l
  ON a.id_autor = l.id_autor
INNER JOIN editora AS e
  ON l.id_editora = e.id_editora
GROUP BY
  a.nome,
  e.nome
ORDER BY
  a.nome,
  total_livros DESC;

-- Exercício 2 (BD Biblioteca): Listar a média de páginas dos livros por autor.
-- Esta consulta calcula a média de páginas dos livros para cada autor.
-- Ela une as tabelas de autor e livro e agrupa os resultados pelo nome do autor.
-- Nota: A execução desta consulta presume a existência da coluna 'num_paginas' na tabela 'livro',
[cite_start]-- conforme sugerido no slide de correção. [cite: 734, 735]
SELECT
  a.nome AS autor,
  AVG(l.num_paginas) AS media_de_paginas
FROM autor AS a
INNER JOIN livro AS l
  ON a.id_autor = l.id_autor
GROUP BY
  a.nome
ORDER BY
  media_de_paginas DESC;

-- Exercício 3 (limnologia_db): Mostrar o total de campanhas por reservatório e instituição.
-- A consulta retorna o número total de campanhas de coleta realizadas
[cite_start]-- em cada reservatório, discriminadas por instituição. [cite: 810, 811, 812, 813, 814, 815, 816, 817]
-- Para isso, une as tabelas de campanha, reservatório e instituição e agrupa pelos seus respectivos nomes.
SELECT
  r.nome AS reservatorio,
  i.nome AS instituicao,
  COUNT(c.id_campanha) AS total_campanhas
FROM campanha AS c
INNER JOIN reservatorio AS r
  ON c.id_reservatorio = r.id_reservatorio
INNER JOIN instituicao AS i
  ON c.id_instituicao = i.id_instituicao
GROUP BY
  r.nome,
  i.nome
ORDER BY
  r.nome,
  total_campanhas DESC;

-- Exercício 4 (limnologia_db): Mostrar a média de valores de parâmetros por reservatório.
-- Esta consulta gera um relatório com a média dos valores coletados para cada parâmetro
[cite_start]-- (ex: temperatura, oxigênio) em cada reservatório. [cite: 841, 843, 844, 845]
-- Ela une as tabelas de série temporal, reservatório e parâmetro, agrupando o resultado
-- pelo nome do reservatório e do parâmetro.
SELECT
  r.nome AS reservatorio,
  p.nome_parametro,
  AVG(s.valor) AS media_valores
FROM serie_temporal AS s
INNER JOIN reservatorio AS r
  ON s.id_reservatorio = r.id_reservatorio
INNER JOIN parametro AS p
  ON s.id_parametro = p.id_parametro
GROUP BY
  r.nome,
  p.nome_parametro
ORDER BY
  r.nome,
  p.nome_parametro;

-- Exercício 5 (limnologia_db): Listar as instituições que coletaram em mais de um reservatório.
[cite_start]-- O objetivo desta consulta é identificar instituições parceiras com maior abrangência de atuação. [cite: 851]
-- Ela retorna o nome das instituições e a contagem de reservatórios distintos em que cada uma
[cite_start]-- realizou coletas, exibindo apenas aquelas que atuaram em mais de um reservatório. [cite: 852, 853, 854, 855, 856, 857]
SELECT
  i.nome AS instituicao,
  COUNT(DISTINCT c.id_reservatorio) AS total_reservatorios
FROM instituicao AS i
INNER JOIN campanha AS c
  ON i.id_instituicao = c.id_instituicao
GROUP BY
  i.nome
HAVING
  COUNT(DISTINCT c.id_reservatorio) > 1
ORDER BY
  total_reservatorios DESC;