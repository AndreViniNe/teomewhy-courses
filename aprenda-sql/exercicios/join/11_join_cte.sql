-- Quem iniciou o curso no primeiro dia, 
-- em média assistiu quantas aulas?

WITH tb_primeiro_dia AS (
  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE SUBSTR(DtCriacao, 1, 10) = '2025-08-25'
),

tb_dias_curso AS (
  SELECT DISTINCT IdCliente,
         SUBSTR(DtCriacao, 1, 10) AS presencaDia
  FROM transacoes
  WHERE 1=1
    AND DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

  ORDER BY IdCliente, presencaDia
),

tb_qtde_dias AS (
  SELECT T1.IdCliente,
        COUNT(DISTINCT T2.presencaDia) AS QtdeDias

  FROM tb_primeiro_dia T1

  LEFT JOIN tb_dias_curso T2
    ON T1.IdCliente = T2.IdCliente

  GROUP BY T1.IdCliente
)

SELECT AVG(QtdeDias) AS AvgAulasAssistidas
FROM tb_qtde_dias