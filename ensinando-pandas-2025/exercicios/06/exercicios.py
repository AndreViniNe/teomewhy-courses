# Quem teve mais transações de Streak?
# %%
import pandas as pd

# %%
transacoes = pd.read_csv("../../data/transacoes.csv", sep=';')
transacoes.head()

# %%
tr_produto = pd.read_csv("../../data/transacao_produto.csv", sep=';')
tr_produto.head()

# %%
produtos = pd.read_csv("../../data/produtos.csv", sep=';')
produtos.head()

#%%
produtos['IdProduto'] = produtos['IdProduto'].astype(str)
produtos.info()

# %%
colunas_id = ['IdTransacao', 'IdCliente', 'IdProduto']

cliente_transacao_produto = transacoes.merge(
    right=tr_produto,
    how='left',
    on='IdTransacao'
)[colunas_id]

cliente_transacao_produto.head()

# %%
df_full = cliente_transacao_produto.merge(
    right=produtos,
    how='right',
    on='IdProduto'
)

df_full.head()

# %%
df_full = (
    df_full[df_full['DescNomeProduto'] == 'Presença Streak']
    .drop(columns=["DescDescricaoProduto", "DescCategoriaProduto"])
)

# %%
(df_full.groupby(by='IdCliente')["IdTransacao"]
        .count()
        .sort_values(ascending=False)
        .head(1)
)

# %%
#forma mais eficiente
produtos = produtos[produtos['DescNomeProduto'] == 'Presença Streak']

(transacoes.merge(tr_produto, how='left', on='IdTransacao')
           .merge(produtos, on='IdProduto', how='right')
           .groupby(by='IdCliente')["IdTransacao"]
           .count()
           .sort_values(ascending=False)
           .head(1)
)
# %%
