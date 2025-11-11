-- Qual o valor médio de pontos positivos 
-- por dia?
SELECT SUM(QtdePontos) AS qtdePontos,

       COUNT(DISTINCT SUBSTR(DtCriacao, 1, 10)) AS qtdeDiasUnicos,

       SUM(QtdePontos) / COUNT(DISTINCT SUBSTR(DtCriacao, 1, 10)) AS avgPontosDia

FROM transacoes

WHERE 1=1
  AND QtdePontos > 0;