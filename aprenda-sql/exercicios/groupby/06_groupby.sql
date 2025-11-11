-- Qual dia da semana tem mais pedidos em 2025?

SELECT STRFTIME('%w', SUBSTR(DtCriacao, 1, 10)) AS diaSemana,
       COUNT(DISTINCT IdTransacao) AS transacoesDiaSemana

FROM transacoes

WHERE 1 = 1
  AND DtCriacao >= '2025-01-01'
  AND DtCriacao < '2026-01-01'
  
GROUP BY 1;