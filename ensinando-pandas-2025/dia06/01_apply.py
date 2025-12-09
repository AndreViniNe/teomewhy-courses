# %%
import pandas as pd

# %%
df = pd.read_csv("../data/clientes.csv", sep=';')
df.head()

# %%
id_cliente = '000dc0f6-e4f2-4a42-b8cd-b586ed1c709a'

def get_last_id(x):
    return x.split(sep='-')[-1]

get_last_id(id_cliente)
# %%
df["idCliente"].apply(get_last_id)

# %%
