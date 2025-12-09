# %%
import pandas as pd

# %%
idades = [31, 12, 17, 29, 68, 69, 19, 53, 20, 21, 9, 11, 12, 19, 20, 82, 20]
idades = pd.Series(idades)

idades.sum()
idades.mean()
idades.min()
idades.max()
idades.describe()

# %%
clientes = pd.read_csv("../data/clientes.csv", sep=';')
clientes.head()

# %%
clientes['flTwitch'].sum()

# %%
redes_sociais = ['flEmail', 'flTwitch', 'flYouTube',
                 'flBlueSky', 'flInstagram']

clientes[redes_sociais].sum()

# %%
num_columns = clientes.dtypes[(clientes.dtypes == 'int64')].index.tolist()
clientes[num_columns].mean()

# %%
clientes[num_columns].describe()
# %%
