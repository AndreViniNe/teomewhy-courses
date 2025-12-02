# %%
import pandas as pd

idades = [20, 25, 30, 35, 40,
          45, 50, 55, 60, 65,
          32, 35, 21, 19, 23,
          17, 31, 29, 29, 28]

nomes = ["André", "Isabela", "Téo", "Maria", "João",
          "Ana", "Carlos", "Beatriz", "Lucas", "Mariana",
          "Pedro", "Sofia", "Rafael", "Julia", "Gabriel",
          "Laura", "Felipe", "Isadora", "Bruno", "Camila"]

series_idades = pd.Series(idades)
series_nomes = pd.Series(nomes)
# %%
df = pd.DataFrame({
    "Nome": series_nomes,
    "Idade": series_idades
})
df
# %%
df.iloc[0]
# %%
df.iloc[0]["Nome"]
# %%
