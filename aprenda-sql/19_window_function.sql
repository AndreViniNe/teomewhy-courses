WITH tb_cliente_dia AS (
  SELECT DISTINCT IdCliente,
        SUBSTR(DtCriacao, 1, 10) AS DtDia

  FROM transacoes

  WHERE 1=1
    AND SUBSTR(DtCriacao, 1, 4) = '2025'
    
  ORDER BY IdCliente, DtDia
),

tb_lag AS (
  SELECT *,
        LAG(DtDia) OVER (PARTITION BY IdCliente ORDER BY DtDia) AS LagDia

  FROM tb_cliente_dia
),

tb_diff_dt AS (
  SELECT *,
        JULIANDAY(DtDia) - JULIANDAY(LagDia) AS DtDiff
  FROM tb_lag
),

avg_cliente AS (
  SELECT IdCliente,
        AVG(DtDiff) AS AvgDia
  FROM tb_diff_dt
  GROUP BY IdCliente
)

SELECT AVG(AvgDia)

FROM avg_cliente