-- Quantidade de usuários cadastrados (absoluto e acumulado) 
-- ao longo do tempo?
WITH tb_usuarios_mes AS (
  SELECT STRFTIME('%Y/%m', SUBSTR(DtCriacao, 1, 10)) AS DtMes,
         COUNT(*) AS QtdeUsuarios
  FROM clientes
  GROUP BY DtMes
  ORDER BY DtMes
)

SELECT *,
       SUM(QtdeUsuarios) OVER (PARTITION BY 1 ORDER BY DtMes) AS QtdeAcumulada

FROM tb_usuarios_mes