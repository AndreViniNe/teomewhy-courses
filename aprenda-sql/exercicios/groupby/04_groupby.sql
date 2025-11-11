-- Quantos produtos são de RPG
SELECT COUNT(*)

FROM produtos

WHERE 1=1
  AND DescCategoriaProduto = 'rpg';