# %%
import pandas as pd
import os

# %%
def read_files(file_name: str):
    df = (pd.read_csv(f"../../data/ipea/{file_name}.csv", sep=';')
            .rename(columns={"valor": file_name})
            .set_index(["nome", "período"])
            .drop(columns="cod"))
    
    return df

# %%
files_list = os.listdir('../../data/ipea')
files_list

# %%
dfs=[]

for i in files_list:
    file_name = i.split('.')[0]
    dfs.append(read_files(file_name))

# dfs = [read_files(i.split(".")[0]) for i in files_list]

# %%
dfs[-1]

# %%
pd.concat(dfs, axis=1).reset_index()
# %%
