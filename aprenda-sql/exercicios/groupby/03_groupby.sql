-- Qual cliente fez mais transações no ano
-- de 2024?

SELECT IdCliente,
       COUNT(*) AS totalTransacoes

FROM transacoes

-- WHERE 1=1
--   AND DtCriacao >= '2024-01-01'
--   AND DtCriacao < '2025-01-01'
WHERE STRFTIME('%Y', SUBSTR(DtCriacao, 1, 19)) = '2024' 
  
GROUP BY IdCliente

ORDER BY totalTransacoes DESC

LIMIT 10;