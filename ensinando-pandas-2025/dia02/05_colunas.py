# %%

import pandas as pd

df = pd.read_csv("../data/transacoes.csv", sep=";")
df.head()
# %%
df.shape
# %%
df.info(memory_usage="deep")
# %%
df.dtypes
# %%
df.rename(
    columns={
        "QtdePontos": "QtPontos",
        "DescSistemaOrigem": "SistemaOrigem"
    },
    inplace=True
)
df.head()
# %%
colunas = ["IdCliente", "QtPontos"]

df[colunas]
# %%
df[["IdCliente", "IdTransacao", "QtPontos"]].head()
# %%
