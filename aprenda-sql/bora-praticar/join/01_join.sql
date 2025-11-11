-- Qual categoria tem mais produtos vendidos

SELECT P.DescCategoriaProduto,
       COUNT(QtdeProduto)

FROM transacao_produto TP

LEFT JOIN produtos P
  ON TP.IdProduto = P.IdProduto

GROUP BY P.DescCategoriaProduto
ORDER BY 2 DESC

LIMIT 5;