-- Saldo de pontos acumulado de cada usuário
WITH tb_cliente_dia AS (
  SELECT IdCliente,
        SUBSTR(DtCriacao, 1, 10) AS DtDia,
        SUM(QtdePontos) AS TotalPontos
  FROM transacoes
  GROUP BY IdCliente, DtDia
)

SELECT *,
       SUM(TotalPontos) OVER (PARTITION BY IdCliente ORDER BY DtDia) AS SaldoPontos

FROM tb_cliente_dia