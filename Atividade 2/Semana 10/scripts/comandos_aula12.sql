-- Consulta para gerar um relatório com a média, o maior e o menor valor de pH medido em cada reservatório.

SELECT
  r.nome AS "Reservatório",
  -- Subconsulta para calcular a média de pH para cada reservatório.
  -- É uma subconsulta escalar correlacionada, pois é executada para cada linha da tabela externa (reservatorio r)
  -- e retorna um único valor (a média). A correlação é feita através de 'WHERE s.id_reservatorio = r.id_reservatorio'.
  (
    SELECT
      AVG(s.valor)
    FROM serie_temporal AS s
    INNER JOIN parametro AS p
      ON s.id_parametro = p.id_parametro
    WHERE
      s.id_reservatorio = r.id_reservatorio AND p.nome_parametro = 'pH'
  ) AS "Média pH",
  -- Subconsulta para obter o valor mínimo de pH para cada reservatório.
  -- Segue a mesma lógica da subconsulta anterior, mas utiliza a função de agregação MIN().
  (
    SELECT
      MIN(s.valor)
    FROM serie_temporal AS s
    INNER JOIN parametro AS p
      ON s.id_parametro = p.id_parametro
    WHERE
      s.id_reservatorio = r.id_reservatorio AND p.nome_parametro = 'pH'
  ) AS "pH Mínimo",
  -- Subconsulta para obter o valor máximo de pH para cada reservatório.
  -- Utiliza a função de agregação MAX() para encontrar o maior valor registrado.
  (
    SELECT
      MAX(s.valor)
    FROM serie_temporal AS s
    INNER JOIN parametro AS p
      ON s.id_parametro = p.id_parametro
    WHERE
      s.id_reservatorio = r.id_reservatorio AND p.nome_parametro = 'pH'
  ) AS "pH Máximo"
FROM reservatorio AS r
ORDER BY
  r.nome;