SELECT ROUND(AVG(QtdePontos), 2) AS mediaCarteira,
      ROUND(1. * SUM(QtdePontos) / COUNT(IdCliente), 2) AS mediaCarteiraRoots,
      MIN(QtdePontos) AS minCarteira,
      max(QtdePontos) AS maxCarteira,
      SUM(flTwitch)

FROM clientes;