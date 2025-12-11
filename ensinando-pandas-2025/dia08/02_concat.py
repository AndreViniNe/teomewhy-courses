# %%
import pandas as pd

# %%
df = pd.DataFrame({
    "cliente": [1,2,3,4,5,],
    "nome": ["Andre", "Isa", "Rafael", "Teo", "Pedro",]
})

df

# %%
df_02 = pd.DataFrame({
    "cliente": [6,7,8,],
    "nome": ["Rosalina", "Herbert", "Donatello",],
    "idade": [63, 24, 17,]
})

df_02

# %%
df_03 = pd.DataFrame({
    "idade": [20, 19, 24, 45, 19]
})

# %%
dfs = [df, df_02]

pd.concat(dfs, ignore_index=True)

# %%
df_03 = df_03.sort_values(by='idade').reset_index(drop=True)
df_03

# %%
pd.concat([df, df_03], axis=1)
# %%
