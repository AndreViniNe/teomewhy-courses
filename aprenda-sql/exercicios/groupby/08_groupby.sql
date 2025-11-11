-- Qual o produto com mais pontos transacionados?

SELECT IdProduto,
      SUM(vlProduto * QtdeProduto) AS totalPontos,
      SUM(QtdeProduto) AS qtdeVenda

FROM transacao_produto

GROUP BY IdProduto

ORDER BY 2 DESC;