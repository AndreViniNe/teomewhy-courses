-- Quantos clientes tem email cadastrado

-- SELECT flEmail AS emailCadastrado,
--       COUNT(IdCliente)

-- FROM clientes

-- GROUP BY flEmail
-- HAVING flEmail = 1;

SELECT SUM(flEmail)

FROM clientes;