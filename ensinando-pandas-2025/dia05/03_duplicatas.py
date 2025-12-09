# %%
import pandas as pd

# %%
df = pd.DataFrame({
    "nome": ["André", "Isa", "Rafael", "Téo", "Leonardo", "Rafael", "Pedro", "Rafael"],
    "sobrenome": ["Neves", "Veloso", "Silva", "Calvo", "Calvo", "Silva", "Silva", "Silva"],
    "salario": [2500, 1500, 3500, 4200, 4000, 2700, 2000, 7860]
})

df

# %%
df = (df.sort_values("salario", ascending=False)
        .drop_duplicates(subset=["nome", "sobrenome"], keep="first"))

df

# %%
