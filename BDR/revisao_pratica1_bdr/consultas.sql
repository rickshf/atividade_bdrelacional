-- Consulta simples
-- Liste todos os clientes cadastrados, exibindo id_cliente, nome e cidade.
SELECT id_cliente, nome, cidade FROM cliente;

--  Consulta com filtro
-- Liste todos os jogos lançados após 2020, exibindo titulo e ano_lancamento.
SELECT titulo, ano_lancamento FROM jogo WHERE ano_lancamento > 2020;

-- Função de agregação
-- Liste quantos jogos foram comprados no total pela rede (soma das quantidades em compra_jogo).
SELECT SUM(quantidade) AS total_jogos_comprados FROM compra_jogo;
