-- Qual cliente mais juntou pontos positivos
-- em 05-2025?

SELECT IdCliente,
       SUM(QtdePontos) AS totalPontos,
       MAX(QtdePontos) AS maiorTransacao

FROM transacoes

WHERE 1=1
  AND DtCriacao >= '2025-05-01'
  AND DtCriacao < '2025-06-01'
  AND QtdePontos > 0
  
GROUP BY IdCliente

ORDER BY totalPontos DESC

LIMIT 1;