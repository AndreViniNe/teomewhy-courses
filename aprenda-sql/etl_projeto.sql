-- WITH tb_transacoes AS (
--   SELECT IdTransacao, 
--          IdCliente, 
--          QtdePontos,
--          SUBSTR(DtCriacao,1,19) AS DtCriacao,
--          JULIANDAY('{date}') - JULIANDAY(SUBSTR(DtCriacao,1,10)) AS DiffDate,
--          CAST(STRFTIME('%H', SUBSTR(DtCriacao,1,19)) AS INTEGER) AS DtHora
--   FROM transacoes
--   WHERE DtCriacao < '{date}'
-- ),

-- tb_qtde_transacoes AS (
--   SELECT DISTINCT IdCliente,
--         COUNT(IdTransacao) AS QtdeTransacoesVida,
--         COUNT(CASE WHEN DiffDate <= 7 THEN IdTransacao END) AS QtdeTransacoesD7, 
--         COUNT(CASE WHEN DiffDate <= 14 THEN IdTransacao END) AS QtdeTransacoesD14, 
--         COUNT(CASE WHEN DiffDate <= 28 THEN IdTransacao END) AS QtdeTransacoesD28, 
--         COUNT(CASE WHEN DiffDate <= 56 THEN IdTransacao END) AS QtdeTransacoesD56,

--         ROUND(MIN(DiffDate)) AS DtUltimaInteracao,

--         SUM(QtdePontos) AS SaldoPontos,

--         SUM(CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS QtdePontosPositivosVida,
--         SUM(CASE WHEN QtdePontos > 0 AND DiffDate <= 7 THEN QtdePontos ELSE 0 END) AS QtdePontosPositivosD7, 
--         SUM(CASE WHEN QtdePontos > 0 AND DiffDate <= 14 THEN QtdePontos ELSE 0 END) AS QtdePontosPositivosD14,
--         SUM(CASE WHEN QtdePontos > 0 AND DiffDate <= 28 THEN QtdePontos ELSE 0 END) AS QtdePontosPositivosD28,
--         SUM(CASE WHEN QtdePontos > 0 AND DiffDate <= 56 THEN QtdePontos ELSE 0 END) AS QtdePontosPositivosD56,

--         SUM(CASE WHEN QtdePontos < 0 THEN QtdePontos ELSE 0 END) AS QtdePontosNegativosVida,
--         SUM(CASE WHEN QtdePontos < 0 AND DiffDate <= 7 THEN QtdePontos ELSE 0 END) AS QtdePontosNegativosD7, 
--         SUM(CASE WHEN QtdePontos < 0 AND DiffDate <= 14 THEN QtdePontos ELSE 0 END) AS QtdePontosNegativosD14,
--         SUM(CASE WHEN QtdePontos < 0 AND DiffDate <= 28 THEN QtdePontos ELSE 0 END) AS QtdePontosNegativosD28,
--         SUM(CASE WHEN QtdePontos < 0 AND DiffDate <= 56 THEN QtdePontos ELSE 0 END) AS QtdePontosNegativosD56

--   FROM tb_transacoes
--   GROUP BY IdCliente
-- ),

-- tb_cliente AS (
--   SELECT DISTINCT IdCliente,
--          SUBSTR(DtCriacao,1,19) AS DtCriacao,
--          JULIANDAY('{date}') - JULIANDAY(SUBSTR(DtCriacao,1,10)) AS DtIdadeBase
--   FROM clientes
--   -- ORDER BY DtIdadeBase DESC
-- ),

-- tb_transacao_produto AS (
--   SELECT T1.*,
--          T3.DescNomeProduto,
--          T3.DescCategoriaProduto

--   FROM tb_transacoes AS T1

--   LEFT JOIN transacao_produto T2
--     ON T1.IdTransacao = T2.IdTransacao

--   LEFT JOIN produtos T3
--     ON T2.IdProduto = T3.IdProduto
-- ),

-- tb_cliente_produto AS (
--   SELECT IdCliente,
--         DescNomeProduto,
--         COUNT(*) AS QtdeVida,
--         COUNT(CASE WHEN DiffDate <= 56 THEN IdTransacao END) AS QtdeD56,
--         COUNT(CASE WHEN DiffDate <= 28 THEN IdTransacao END) AS QtdeD28,
--         COUNT(CASE WHEN DiffDate <= 14 THEN IdTransacao END) AS QtdeD14,
--         COUNT(CASE WHEN DiffDate <= 7 THEN IdTransacao END) AS QtdeD7
  
--   FROM tb_transacao_produto
--   GROUP BY IdCliente, DescNomeProduto
-- ),

-- tb_cliente_produto_rn AS (
--   SELECT *,
--         ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeVida DESC) AS RnVida,
--         ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeD56 DESC) AS Rn56,
--         ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeD28 DESC) AS Rn28,
--         ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeD14 DESC) AS Rn14,
--         ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeD7 DESC) AS Rn7
--   FROM tb_cliente_produto
-- ),

-- tb_cliente_D28 AS (
-- SELECT DISTINCT IdCliente,
--        STRFTIME('%w', DtCriacao) AS DtDia,
--        COUNT(*) AS QtdeTransacao
-- FROM tb_transacoes
-- WHERE DiffDate <= 28
-- GROUP BY IdCliente, DtDia
-- ),

-- tb_cliente_D28_rn AS (
--   SELECT *,
--         ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeTransacao DESC) AS RnDiaSemanaD28
--   FROM tb_cliente_D28
-- ),

-- tb_cliente_periodo_D28 AS (
--   SELECT IdCliente,
--         CASE 
--           WHEN DtHora BETWEEN 7 AND 12 THEN 'MANHÃ' 
--           WHEN DtHora BETWEEN 13 AND 18 THEN 'TARDE' 
--           WHEN DtHora BETWEEN 19 AND 23 THEN 'NOITE' 
--           WHEN DtHora > 23 OR DtHora < 7 THEN 'MADRUGADA'
--           ELSE 'SEM INFORMAÇÃO'
--           END AS DtPeriodo28,
--           COUNT(*) AS QtdeTransacao             
--   FROM tb_transacoes
--   WHERE DiffDate <= 28
--   GROUP BY 1,2
-- ),

-- tb_cliente_periodo_D28_rn AS (
--   SELECT *,
--          ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeTransacao DESC) AS RnPeriodo
--   FROM tb_cliente_periodo_D28
-- ),

-- tb_join AS (
--   SELECT T1.*,
--          T2.DtIdadeBase,
--          T3.DescNomeProduto AS ProdutoVida,
--          T4.DescNomeProduto AS Produto56,
--          T5.DescNomeProduto AS Produto28,
--          T6.DescNomeProduto AS Produto14,
--          T7.DescNomeProduto AS Produto7,
--          COALESCE(T8.DtDia, -1) AS DtSemana28,
--          COALESCE(T9.DtPeriodo28, 'SEM INFORMACAO') AS DtPeriodoMaisTransacao28

--   FROM tb_qtde_transacoes T1

--   LEFT JOIN tb_cliente T2
--     ON T1.IdCliente = T2.IdCliente

--   LEFT JOIN tb_cliente_produto_rn T3
--     ON T1.IdCliente = T3.IdCliente
--     AND T3.RnVida = 1

--   LEFT JOIN tb_cliente_produto_rn T4
--     ON T1.IdCliente = T4.IdCliente
--     AND T4.Rn56 = 1

--   LEFT JOIN tb_cliente_produto_rn T5
--     ON T1.IdCliente = T5.IdCliente
--     AND T5.Rn28 = 1

--   LEFT JOIN tb_cliente_produto_rn T6
--     ON T1.IdCliente = T6.IdCliente
--     AND T6.Rn14 = 1

--   LEFT JOIN tb_cliente_produto_rn T7
--     ON T1.IdCliente = T7.IdCliente
--     AND T7.Rn7 = 1

--   LEFT JOIN tb_cliente_D28_rn T8
--     ON T1.IdCliente = T8.IdCliente
--     AND T8.RnDiaSemanaD28 = 1

--   LEFT JOIN tb_cliente_periodo_D28_rn T9
--     ON T1.IdCliente = T9.IdCliente
--     AND T9.RnPeriodo = 1
-- )


-- SELECT '{date}' AS DtRef,
--        *,
--        1.* QtdeTransacoesD28 / QtdeTransacoesVida AS EngajamentoD28SobreVida

-- FROM tb_join;

SELECT * FROM tb_feature_store_cliente
ORDER BY IdCliente, DtRef