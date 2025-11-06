-- Qual cliente mais juntou pontos positivos
-- em 05-2025?

SELECT IdCliente,
      qtdePontos,
      DtCriacao

FROM clientes

WHERE 1=1
  AND DtCriacao >= '2025-05-01'
  AND DtCriacao < '2025-06-01';