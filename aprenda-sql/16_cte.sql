-- CTE = Common Table Expression

-- SELECT COUNT(DISTINCT IdCliente)
-- FROM transacoes AS T
-- WHERE T.IdCliente IN (
--   SELECT DISTINCT IdCliente
--   FROM transacoes
--   WHERE SUBSTR(DtCriacao, 1, 10) = '2025-08-25'
-- )
--   AND SUBSTR(T.DtCriacao, 1, 10) = '2025-08-29';

WITH tb_cliente_primeiro_dia AS (

  SELECT DISTINCT IdCliente
  FROM transacoes
  WHERE SUBSTR(DtCriacao, 1, 10) = '2025-08-25'

),

tb_cliente_ultimo_dia AS (

SELECT DISTINCT IdCliente
FROM transacoes
WHERE SUBSTR(DtCriacao, 1, 10) = '2025-08-29'

),

tb_join AS (

SELECT PD.IdCliente AS primCliente,
       UD.IdCliente AS ultCliente
       
FROM tb_cliente_primeiro_dia AS PD

LEFT JOIN tb_cliente_ultimo_dia UD
  ON UD.IdCliente = PD.IdCliente

)

SELECT *
FROM tb_join;