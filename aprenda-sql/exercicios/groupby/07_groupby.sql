-- Qual o produto mais transacionado?

SELECT IdProduto,
       SUM(QtdeProduto) AS totalProduto

FROM transacao_produto

GROUP BY IdProduto

ORDER BY 2 DESC

LIMIT 10;


SELECT *

FROM produtos

WHERE IdProduto = 5;