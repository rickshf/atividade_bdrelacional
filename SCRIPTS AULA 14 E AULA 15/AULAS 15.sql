-- Contexto: Biblioteca
-- 1. Stored Procedure para atualizar o autor de um livro Esta procedure recebe o ID do livro e o novo nome do autor, atualizando o registro.


CREATE OR REPLACE PROCEDURE sp_atualizar_autor(
    id_livro_p INT, 
    novo_autor_p VARCHAR
)
LANGUAGE SQL
AS $$
    UPDATE livro 
    SET autor = novo_autor_p 
    WHERE id_livro = id_livro_p;
$$;

-- Testando:
-- CALL sp_atualizar_autor(1, 'Machado de Assis Junior');


-- 2. Stored Procedure para excluir livro pelo ID Esta procedure remove um livro baseado no ID fornecido.

CREATE OR REPLACE PROCEDURE sp_excluir_livro(
    id_livro_p INT
)
LANGUAGE SQL
AS $$
    DELETE FROM livro 
    WHERE id_livro = id_livro_p;
$$;

-- Testando:
-- CALL sp_excluir_livro(1);

-- Contexto: Projeto ABP (limnologia_db)
--Aqui focamos nas tabelas principais do projeto de monitoramento de água.

--1. Stored Procedure para cadastrar reservatório Insere um novo reservatório na tabela.

CREATE OR REPLACE PROCEDURE sp_cadastrar_reservatorio(
    nome_reservatorio_p VARCHAR
)
LANGUAGE SQL
AS $$
    INSERT INTO reservatorio (nome) 
    VALUES (nome_reservatorio_p);
$$;

-- 2. Stored Procedure para cadastrar parâmetro ambiental Insere um novo parâmetro (ex: 'pH', 'Turbidez').

CREATE OR REPLACE PROCEDURE sp_cadastrar_parametro(
    nome_parametro_p VARCHAR
)
LANGUAGE SQL
AS $$
    INSERT INTO parametro (nome_parametro) 
    VALUES (nome_parametro_p);
$$;

-- 3. Stored Procedure para registrar medição Esta procedure insere os dados na tabela de série temporal (baseada no exemplo do slide 21 ).


CREATE OR REPLACE PROCEDURE sp_registrar_medicao(
    id_reservatorio_p INT,
    id_parametro_p INT,
    valor_p NUMERIC,
    data_p TIMESTAMP
)
LANGUAGE SQL
AS $$
    INSERT INTO serie_temporal (id_reservatorio, id_parametro, valor, data_hora)
    VALUES (id_reservatorio_p, id_parametro_p, valor_p, data_p);
$$;



-- O exercício pede uma procedure que não permita valor negativo e mostre uma mensagem de erro.

-- Para usar condicionais (IF/THEN) e lançar exceções (RAISE EXCEPTION), precisamos mudar a linguagem de SQL para plpgsql


CREATE OR REPLACE PROCEDURE sp_registrar_medicao_segura(
    id_reservatorio_p INT,
    id_parametro_p INT,
    valor_p NUMERIC,
    data_p TIMESTAMP
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Validação: Se o valor for negativo, para a execução e mostra erro
    IF valor_p < 0 THEN
        RAISE EXCEPTION 'Erro: O valor da medição (%) não pode ser negativo.', valor_p;
    END IF;

    -- Se passou na validação, insere o dado
    INSERT INTO serie_temporal (id_reservatorio, id_parametro, valor, data_hora)
    VALUES (id_reservatorio_p, id_parametro_p, valor_p, data_p);
    
    -- Opcional: Mensagem de sucesso (aparece no output do log)
    RAISE NOTICE 'Medição registrada com sucesso.';
END;
$$;

