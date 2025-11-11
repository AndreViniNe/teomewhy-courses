SELECT *

FROM transacao_produto TP

WHERE TP.IdProduto IN(
  SELECT IdProduto
  FROM produtos
  WHERE DescNomeProduto = 'Resgatar Ponei'
);