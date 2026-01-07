SELECT seller_id,
       SUM(T1.price) AS totalRevenue,
       COUNT(DISTINCT T1.order_id) AS qtdeSales

FROM tb_order_items AS T1

GROUP BY seller_id