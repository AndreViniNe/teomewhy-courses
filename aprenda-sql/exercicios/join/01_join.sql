-- Quais clientes mais perderam pontos por Lover?
SELECT T.IdCliente,
       SUM(T.QtdePontos) AS totalPontos

FROM transacoes T

LEFT JOIN transacao_produto TP
  ON T.IdTransacao = TP.IdTransacao

LEFT JOIN produtos P
  ON TP.IdProduto = P.IdProduto

WHERE 1=1
  AND P.DescCategoriaProduto = 'lovers'

GROUP BY T.IdCliente

ORDER BY 2

LIMIT 10;