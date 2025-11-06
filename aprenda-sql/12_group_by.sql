-- SELECT DescCategoriaProduto,
--       COUNT(*) AS contagemCategoria
-- FROM produtos
-- GROUP BY DescCategoriaProduto;

-- SELECT IdProduto,
--       COUNT(*)

-- FROM transacao_produto

-- GROUP BY IdProduto;

SELECT IdCliente,
       SUM(QtdePontos) AS pontosPorCliente,
       COUNT(IdTransacao) AS transacoesPorCliente

FROM transacoes

WHERE 1=1 
  AND DtCriacao >= '2025-07-01'
  AND DtCriacao < '2025-08-01'

GROUP BY IdCliente
HAVING pontosPorCliente >= 4000

ORDER BY pontosPorCliente DESC

LIMIT 10;