# %%
import pandas as pd

df = pd.read_csv("../data/clientes.csv", sep=";")
df.head()
# %%
df.to_csv("clientes.csv", index=False)
# %%
df.to_parquet("clientes.parquet", index=False)
# %%
df2 = pd.read_parquet("clientes.parquet")
df2.head()
# %%
df.to_excel("clientes.xlsx", index=False)
# %%
df3 = pd.read_excel("clientes.xlsx")
df3.head()
# %%
