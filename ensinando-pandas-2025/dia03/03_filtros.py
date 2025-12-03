# %%
import pandas as pd

clientes = pd.read_csv("../data/clientes.csv", sep=';')
clientes.head()

# %%
filtro = clientes["qtdePontos"] == 0
clientes_0_pontos = clientes[filtro]

# %%
clientes_0_pontos["flag_1"] = 1
clientes_0_pontos
# %%
