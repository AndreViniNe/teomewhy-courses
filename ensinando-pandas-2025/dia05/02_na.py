# %%
import pandas as pd
# %%

clientes = pd.read_csv("../data/clientes.csv", sep=";")
clientes.isna().sum()

# %%
clientes.shape

# %%
clientes = clientes.dropna()

# %%
df = pd.DataFrame({
    "nome": ["André", "Isa", "Rafael", "Téo"],
    "idade": [20, 19, None, 52],
    "salario": [None, 1500, None, 1750]
})

df.dropna(how="all", subset=["idade", "salario"])
# %%
medias = df[['idade', 'salario']].mean()
df.fillna(medias)

# %%
