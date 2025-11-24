WITH tb_transacoes_cliente_dia AS (
  SELECT DISTINCT IdCliente,
         SUBSTR(DtCriacao, 1, 10) AS DtDia,
         COUNT(*) AS QtdeTransacao

  FROM transacoes

  WHERE 1=1
    AND DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

  GROUP BY IdCliente, DtDia
),

tb_lag AS (
  SELECT *,
        SUM(QtdeTransacao) OVER (PARTITION BY 1 ORDER BY IdCliente, DtDia) AS QtdeTransacaoAcumulada,
        lag(QtdeTransacao) OVER (PARTITION BY 1 ORDER BY IdCliente, DtDia) AS LagTransacao

  FROM tb_transacoes_cliente_dia
)

SELECT *,
       1.* QtdeTransacao/LagTransacao
FROM tb_lag