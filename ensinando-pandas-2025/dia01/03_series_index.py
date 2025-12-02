# %%
import pandas as pd

idades = [20, 25, 30, 35, 40,
          45, 50, 55, 60, 65,
          32, 35, 21, 19, 23,
          17, 31, 29, 29, 28]

series_idades = pd.Series(idades)
series_idades
# %%
idades[0]
series_idades[0]
# %%
series_idades[-1]
# %%
series_idades = series_idades.sort_values()
series_idades
# %%
series_idades[0]
# %%
series_idades.iloc[0]
# %%
series_idades.iloc[-1]
# %%
series_idades.iloc[:3]
# %%
idades = [20, 25, 30, 35, 40,
          45, 50, 55, 60, 65,
          32, 35, 21, 19, 23,
          17, 31, 29, 29, 28]

indexes = ["André", "Isabela", "Téo", "Maria", "João",
          "Ana", "Carlos", "Beatriz", "Lucas", "Mariana",
          "Pedro", "Sofia", "Rafael", "Julia", "Gabriel",
          "Laura", "Felipe", "Isadora", "Bruno", "Camila"]

series_idades = pd.Series(idades, index=indexes)
series_idades
# %%
series_idades.iloc[[0]]
# %%
