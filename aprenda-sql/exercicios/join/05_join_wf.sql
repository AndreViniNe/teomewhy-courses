-- Quantidade de transações Acumuladas ao longo do tempo?

WITH tb_transacoes_mes AS (
  SELECT STRFTIME('%Y/%m', SUBSTR(DtCriacao, 1, 10)) AS DtMes,
         COUNT(*) AS QtdeTransacoes
  FROM transacoes
  GROUP BY DtMes
  ORDER BY DtMes 
)

SELECT *,
       SUM(QtdeTransacoes) OVER (PARTITION BY 1 ORDER BY DtMes) AS QtdeAcumulada
FROM tb_transacoes_mes