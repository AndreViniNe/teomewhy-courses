# %%
import pandas as pd

# %%
df = pd.read_csv('dados_cartao.csv', sep=';')
df.head()

# %%
df['dtTransacao'] = pd.to_datetime(df['dtTransacao'])
df['vlParcela'] = round(df['vlVenda']/df['qtParcelas'], 2)
df['ordemParcela'] = df.apply(lambda row: [i for i in range(row['qtParcelas'])], axis=1)
df_explode = df.explode('ordemParcela')

# %%

def calc_dt_parcela(row):
    dt = row['dtTransacao'] + pd.DateOffset(months=row['ordemParcela'])
    df = f"{dt.year} - {dt.month}"
    return dt

df_explode['dtParcela'] = df_explode.apply(
    calc_dt_parcela,
    axis=1
)

df_explode

# %%
(df_explode.groupby(["idCliente", "dtParcela"])
           ['vlParcela'].sum()
           .reset_index()
           .pivot_table(index='idCliente',
                        columns='dtParcela',
                        values='vlParcela',
                        fill_value=0))
# %%
