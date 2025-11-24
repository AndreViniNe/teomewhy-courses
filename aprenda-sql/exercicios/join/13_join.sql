-- Qual o dia com mais engajamento de cada aluno
-- que iniciou no curso no dia 1?

WITH aluno_dia01 AS (
  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE SUBSTR(DtCriacao, 1, 10) = '2025-08-25'
),

tb_dia_cliente AS (
  SELECT T1.IdCliente,
        SUBSTR(T2.DtCriacao,1,10) AS DtFormatada,
        COUNT(*) AS QtdeInteracoes

  FROM aluno_dia01 T1

  LEFT JOIN transacoes T2
    ON T1.IdCliente = T2.IdCliente
    AND T2.DtCriacao >= '2025-08-25'
    AND T2.DtCriacao < '2025-08-30'

  GROUP BY T1.IdCliente, DtFormatada
),

tb_rn AS (
  SELECT *,
        ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeInteracoes DESC, DtFormatada) AS rn

  FROM tb_dia_cliente
)

SELECT * 
FROM tb_rn
WHERE rn = 1