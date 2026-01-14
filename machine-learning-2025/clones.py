# %%
import pandas as pd

# %%
df = pd.read_parquet('data/dados_clones.parquet')
df.columns

# %%
from sklearn import tree
import matplotlib.pyplot as plt

X = df.drop(columns=['Status ', 'General Jedi encarregado'])
y=df['Status ']

X.replace({
    "Tipo 1": 1,
    "Tipo 2": 2,
    "Tipo 3": 3,
    "Tipo 4": 4,
    "Tipo 5": 5,
}, inplace=True)

model = tree.DecisionTreeClassifier()

# %%
model.fit(X, y)

# %%
X.columns

# %%
features = ['p2o_master_id', 'Massa(em kilos)', 'Estatura(cm)',
       'Distância Ombro a ombro', 'Tamanho do crânio', 'Tamanho dos pés',
       'Tempo de existência(em meses)']

tree.plot_tree(model, 
               feature_names=features,
               class_names=model.classes_,
               filled=True,
               max_depth=5
            )
# %%
features = ['Massa(em kilos)', 'Estatura(cm)']

df.groupby('Status ')[features].mean()
# %%
