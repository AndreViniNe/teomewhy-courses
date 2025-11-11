SELECT TP.*,
       P.DescNomeProduto

FROM transacao_produto TP

LEFT JOIN produtos P
  ON TP.IdProduto = P.IdProduto
  
;