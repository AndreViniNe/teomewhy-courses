-- Quais clientes assinaram a 
-- lista de presença no dia 2025/08/25?

SELECT t.IdCliente

FROM transacoes T

LEFT JOIN transacao_produto TP
  ON T.IdTransacao = TP.IdTransacao

LEFT JOIN produtos P
  ON TP.IdProduto = P.IdProduto

WHERE 1=1
  AND SUBSTR(T.DtCriacao, 1, 10) = '2025-08-25'
  AND P.DescNomeProduto = 'Lista de presença'
;