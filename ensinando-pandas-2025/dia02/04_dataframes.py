# %%

import pandas as pd

df_clientes = pd.read_csv("../data/clientes.csv", sep=";")
df_clientes.head(n=10)

# %%
df_clientes.tail()
# %%
df_clientes.sample(n=10)
# %%
df_clientes.shape
# %%
df_clientes.columns
# %%
df_clientes.index
# %%
df_clientes.info(memory_usage="deep")
# %%
df_clientes.dtypes
# %%
