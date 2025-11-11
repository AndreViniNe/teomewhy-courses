-- Em 2024, quantas transações de lovers?

SELECT COUNT(*)

FROM transacoes T

LEFT JOIN transacao_produto TP
  ON T.IdTransacao = TP.IdTransacao

LEFT JOIN produtos P
  ON TP.IdProduto = P.IdProduto

WHERE 1=1
  AND T.DtCriacao >= '2024-01-01'
  AND T.DtCriacao < '2025-01-01'
  AND P.DescCategoriaProduto = 'lovers'
;