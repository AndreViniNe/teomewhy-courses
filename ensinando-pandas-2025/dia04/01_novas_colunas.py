# %%

import pandas as pd
import numpy as np

# %%
df = pd.read_csv("../data/clientes.csv", sep=';')
df.head()

# %%
#Operações em Séries são feitas de forma escalar
#ou seja, sem laços de repetição.

df['PontosMais100'] = df['qtdePontos'] + 100
#O escalar 100 percorre toda a série qtdePontos

df.head()
# %%
df['EmailTwitchOr'] = df['flEmail'] + df['flTwitch']
df.head()

# %%
df['EmailTwitchAnd'] = df['flEmail'] * df['flTwitch']
df.head()

# %%
df['QtdeSocial'] = df['flEmail'] + df['flTwitch'] + df['flYouTube'] + df['flBlueSky'] + df['flInstagram']
df.sample()		

# %%
df['qtdePontos'].describe()

# %%
df['logPontos'] = np.log(df['qtdePontos']+1)
df['logPontos'].describe()

# %%
import matplotlib.pyplot as plt
plt.hist(df['logPontos'])
plt.grid(True)
plt.show()
# %%
