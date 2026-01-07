# %%
import pandas as pd
import sqlalchemy

# %%
with open("elt.sql") as open_file:
    query = open_file.read()

print(query)

# %%
engine = sqlalchemy.create_engine("sqlite:///../data/olist.db")

df = pd.read_sql_query(query, engine)
df.head()

# %%
