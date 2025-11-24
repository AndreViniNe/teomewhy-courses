-- Quantidade de transações ao longo do tempo (diário)

DROP TABLE IF EXISTS relatorio_diario;

CREATE TABLE IF NOT EXISTS relatorio_diario AS

WITH tb_diario AS (
  SELECT SUBSTR(DtCriacao,1,10) AS DtDia,
         COUNT(DISTINCT IdTransacao) AS QtdeTransacao
  FROM transacoes
  GROUP BY DtDia
  ORDER BY DtDia
),

tb_acum AS (
  SELECT *,
         SUM(QtdeTransacao) OVER (ORDER BY DtDia) AS QtdeTransacaoAcum
  FROM tb_diario
)

SELECT *
FROM tb_acum;