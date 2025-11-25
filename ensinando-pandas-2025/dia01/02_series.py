# %%
import pandas as pd
# %%
idades = [20, 25, 30, 35, 40,
          45, 50, 55, 60, 65,
          32, 35, 21, 19, 23,
          17, 31, 29, 29, 28]

series_idades = pd.Series(idades)
series_idades
# %%
media = series_idades.mean()
variancia = series_idades.var()
summary_idades = series_idades.describe()
summary_idades
# %%
