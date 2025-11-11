-- Qual mês tivemos mais lista de presença assinada
SELECT STRFTIME('%m/%Y', SUBSTR(T.DtCriacao, 1, 19)) AS mesAno,
       COUNT(T.QtdePontos) AS totalPontos

FROM transacoes T

LEFT JOIN transacao_produto TP
  ON T.IdTransacao = TP.IdTransacao

LEFT JOIN produtos P
  ON TP.IdProduto = P.IdProduto
  
WHERE P.DescNomeProduto = 'Lista de presença'

GROUP BY mesAno

ORDER BY 2 DESC

LIMIT 10;