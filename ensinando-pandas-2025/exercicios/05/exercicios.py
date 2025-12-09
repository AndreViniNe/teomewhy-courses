# %%
# 05.05 - Selecione a primeira transação diária de cada cliente

import pandas as pd

df = pd.read_csv("../../data/transacoes.csv", sep=';')

df["data"] = pd.to_datetime(df["DtCriacao"]).dt.date
transacoes = df.sort_values("DtCriacao")

# %%
first = transacoes.drop_duplicates(subset=["IdCliente", "data"], keep='first')
last = transacoes.drop_duplicates(subset=["IdCliente", "data"], keep='last')

pd.concat([first,last])

# %%
