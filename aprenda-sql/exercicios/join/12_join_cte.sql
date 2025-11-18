-- Dentre os clientes de janeiro/2025, quantos assistiram
-- o curso de SQL?
WITH clientes_janeiro AS (
  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE 1=1
    AND DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'
),

clientes_curso_sql AS (
  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE 1=1
    AND DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
)

SELECT COUNT(DISTINCT T1.IdCliente) AS QtdeJaneiro,
       COUNT(DISTINCT T2.IdCliente) AS QtdeCursoSQL
FROM clientes_janeiro T1

LEFT JOIN clientes_curso_sql T2
  ON T1.IdCliente = T2.IdCliente