-- Do início ao fim do nosso curso (2025/08/25 a 2025/08/29), 
-- quantos clientes assinaram a lista de presença?

SELECT COUNT(DISTINCT T.IdCliente) AS presencaCurso

FROM transacoes T

LEFT JOIN transacao_produto TP
  ON T.IdTransacao = TP.IdTransacao

LEFT JOIN produtos P
  ON TP.IdProduto = P.IdProduto

WHERE 1=1
  AND T.DtCriacao >= '2025-08-25'
  AND T.DtCriacao < '2025-08-30'
  AND P.DescNomeProduto = 'Lista de presença'
;