# %%
import pandas as pd
import numpy as np

# %%
df = pd.read_csv("../data/clientes.csv", sep=';')
df.head()

# %%
max_pontos = df['qtdePontos'].max()
filtro = df['qtdePontos'] == max_pontos
df[filtro]

# %%
df_sortido = df.sort_values(by="qtdePontos", ascending=False)
df_sortido.head()

# %%
(df.sort_values(by="qtdePontos", ascending=False)
    .head()["idCliente"])
# %%
