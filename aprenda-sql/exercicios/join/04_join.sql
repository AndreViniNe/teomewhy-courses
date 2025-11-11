-- Clientes mais antigos tem mais frequência de transação
SELECT C.IdCliente,
       JULIANDAY('now') - JULIANDAY(SUBSTR(C.DtCriacao, 1, 19)) tempoCriacao,
       COUNT(T.IdTransacao)

FROM clientes C

LEFT JOIN transacoes T
  ON C.IdCliente = T.IdCliente
  
GROUP BY C.IdCliente, tempoCriacao

ORDER BY 2 DESC, 3 DESC;