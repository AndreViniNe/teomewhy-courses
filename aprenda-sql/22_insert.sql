DELETE FROM relatorio_diario;

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

INSERT INTO relatorio_diario

SELECT *
FROM tb_acum;

SELECT *
FROM relatorio_diario;