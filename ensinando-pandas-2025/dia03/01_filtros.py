# %%

import pandas as pd

df = pd.read_csv("../data/transacoes.csv", sep=";")
df.head()
# %%
pontos = [10, 1, 1, 1, 50, 100, 20, 35, 130, 70, 49, 51, 5]
pontos_50_mais = [i for i in pontos if i >= 50]
pontos_50_mais
# %%
filtro = (df['QtdePontos'] >= 50) & (df['QtdePontos'] < 100)
df[filtro]

# %%

filtro = (df['QtdePontos'] == 1) | (df['QtdePontos'] == 100)
df[filtro]
# %%
filtro = (df['QtdePontos'] > 0) & (df['QtdePontos'] <= 50) & (df['DtCriacao'] >= '2025-01-01')
df[filtro]

# %%
