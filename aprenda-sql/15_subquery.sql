-- Dos clientes que começaram SQL no primeiro dia,
-- quais chegaram ao 5o dia?
SELECT COUNT(DISTINCT IdCliente)

FROM transacoes AS T

WHERE T.IdCliente IN (
  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE SUBSTR(DtCriacao, 1, 10) = '2025-08-25'
)

  AND SUBSTR(T.DtCriacao, 1, 10) = '2025-08-29';