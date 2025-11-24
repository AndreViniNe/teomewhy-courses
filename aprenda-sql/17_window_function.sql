WITH tb_transacoes_dia AS (
  SELECT SUBSTR(DtCriacao, 1, 10) AS DtDia,
        COUNT(*) AS QtdeTransacao

  FROM transacoes

  WHERE 1=1
    AND DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

  GROUP BY DtDia
)

SELECT *,
       SUM(QtdeTransacao) OVER (PARTITION BY 1 ORDER BY DtDia) AS QtdeTransacaoAcumulada

FROM tb_transacoes_dia