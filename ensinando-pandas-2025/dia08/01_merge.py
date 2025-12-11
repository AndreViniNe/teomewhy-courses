# %%
import pandas as pd

# %%
transacoes = pd.read_csv("../data/transacoes.csv", sep=';')
transacoes.head()

# %%
clientes = pd.read_csv("../data/clientes.csv", sep=';')
clientes.head()

# %%
clientes.rename(columns={'idCliente': 'IdCliente'}, inplace=True)

# %%
transacoes.merge(
    right=clientes, 
    how='left', 
    on=["IdCliente"],
    suffixes=["Transacao", "Cliente"],
)

# %%
