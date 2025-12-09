# %%
import pandas as pd
import requests

# %%
url = 'https://pt.wikipedia.org/wiki/Unidades_federativas_do_Brasil'

headers = {
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) "
        "Chrome/120.0.0.0 Safari/537.36"
    )
}

resp = requests.get(url, headers=headers)
resp.raise_for_status()  # dispara erro se o status não for 200

html = resp.text

#%%
dfs = pd.read_html(html)
uf = dfs[1].drop(columns="Bandeira")
uf.head()

# %%
def str_to_float(x:str):
    x = float(x.replace(' ', '')
                .replace(',', '.')
                .replace('\xa0', ''))
    return x

# %%
columns = ["Área (km²)", "PIB per capita (R$) (2015)", 
           "População (Censo 2022)", "PIB (2015)"]
for i in columns:
    uf[i] = uf[i].apply(str_to_float)
uf

# %%
def idade_str_to_float(idade):
    return float(idade.split(' ')[0].replace(',', '.'))

# %%
uf['Expectativa de vida (2016)'] = uf['Expectativa de vida (2016)'].apply(idade_str_to_float)
uf
# %%
def uf_to_regiao(uf):
    if uf in ["Amazonas", "Pará", "Roraima", "Amapá", "Rondônia", "Acre", "Tocantins"]:
        return "Região Norte"
    elif uf in ["Piauí", "Maranhão", "Pernambuco", "Rio Grande do Norte", "Paraíba", "Ceará", "Bahia", "Alagoas", "Sergipe"]:
        return "Região Nordeste"
    elif uf in ["Mato Grosso", "Mato Grosso do Sul", "Goiás"]:
        return "Região Centro-Oeste"
    elif uf in ["São Paulo", "Rio de Janeiro", "Espírito Santo", "Minas Gerais"]:
        return "Região Sudeste"
    elif uf in ["Rio Grande do Sul", "Paraná", "Santa Catarina"]:
        return "Região Sul"

# %%
uf["Regiao"] = uf['Unidade federativa'].apply(uf_to_regiao)
uf

# %%
def mortalidade_to_float(x):
    x = float(x.replace('‰', "")
               .replace(',', '.'))
    
    return x/1000

uf['Mortalidade infantil (2016)'] = uf['Mortalidade infantil (2016)'].apply(mortalidade_to_float)
uf

# %%
def agrupamento_uf(linha):
    if (1==1
        and linha["PIB per capita (R$) (2015)"] > 30000
        and linha['Mortalidade infantil (2016)'] < (15/1000)
        and linha["IDH (2010)"] > 700):
        return "Uma boa UF"
    return "UF não tão boa"

# %%
uf["Classificação UF"] = uf.apply(agrupamento_uf, axis=1)
uf
# %%
