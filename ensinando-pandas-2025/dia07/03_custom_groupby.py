# %%
import pandas as pd
import math

transacoes = pd.read_csv("../data/transacoes.csv", sep=';')
transacoes.head()

# %%
#sqrt((amplitude - mean) ** 2)
def diff_amp(x: pd.Series):
    amplitude = x.max() - x.min()
    mean = x.mean()
    return math.sqrt((amplitude - mean) ** 2)

idades = pd.Series([12, 17, 48, 49, 50, 23, 35, 21])
diff_amp(idades)

# %%
summary = (transacoes.groupby(by="IdCliente", as_index=False)
            .agg({
                "IdTransacao": ['count'],
                "QtdePontos": ['count', 'mean', diff_amp]
            }))

summary.columns = ['IdCliente', 'QtdeTransacao', 'TotalPontos', 
                   'AvgPontos', 'AmpMeanDiff']
summary
# %%
