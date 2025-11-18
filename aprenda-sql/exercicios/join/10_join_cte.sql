-- Como foi a curva de Churn do Curso de SQL?
-- SELECT SUBSTR(DtCriacao,1,10) AS DtDia,
--        COUNT(DISTINCT IdCliente) AS QtdeCliente

-- FROM transacoes

-- WHERE 1=1
--   AND DtCriacao >= '2025-08-25'
--   AND DtCriacao < '2025-08-30'

-- GROUP BY DtDia

WITH tb_primeiro_dia AS (
  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE SUBSTR(DtCriacao, 1, 10) = '2025-08-25'
)

SELECT COUNT(DISTINCT T1.IdCliente),
       SUBSTR(T2.DtCriacao,1,10) AS DtDia,
       1.* COUNT(DISTINCT T1.IdCliente) / (SELECT COUNT(*) FROM tb_primeiro_dia) AS PctRetencao

FROM tb_primeiro_dia T1

LEFT JOIN transacoes T2
  ON T1.IdCliente = T2.IdCliente

WHERE 1=1
  AND T2.DtCriacao >= '2025-08-25'
  AND T2.DtCriacao < '2025-08-30'

GROUP BY DtDia;