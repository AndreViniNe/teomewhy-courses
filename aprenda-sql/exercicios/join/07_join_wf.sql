-- Qual o dia da semana mais ativo de cada usuário?
WITH tb_cliente_semana AS (
  SELECT DISTINCT IdCliente,
        STRFTIME('%w', SUBSTR(DtCriacao, 1, 10)) AS DtDiaSemana,
        COUNT(*) QtdeTransacoes
  FROM transacoes
  GROUP BY IdCliente, DtDiaSemana
),

tb_rn AS (
  SELECT *,
        CASE
          WHEN DtDiaSemana = '1' THEN 'SEGUNDA-FEIRA'
          WHEN DtDiaSemana = '2' THEN 'TERÇA-FEIRA'
          WHEN DtDiaSemana = '3' THEN 'QUARTA-FEIRA'
          WHEN DtDiaSemana = '4' THEN 'QUINTA-FEIRA'
          WHEN DtDiaSemana = '5' THEN 'SEXTA-FEIRA'
          WHEN DtDiaSemana = '6' THEN 'SÁBADO'
          ELSE 'DOMINGO'
        END AS DescDiaSemana,
        ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY QtdeTransacoes DESC) AS rn
  FROM tb_cliente_semana
)

SELECT IdCliente, DescDiaSemana, QtdeTransacoes
FROM tb_rn
WHERE rn = 1