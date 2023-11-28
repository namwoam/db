from sqlite3 import connect
import psycopg2
import pandas as pd

con = psycopg2.connect(database="sales", user="postgres",
                       password="postgres", host="localhost", port="5432")
sql_query = """
Select ProductID , SalesDate , Sum( Quantity ) As TotalQty
From Sales
Where SalesDate <= '2015-12-31 '
And ProductID = 1
Group By ProductID , SalesDate
Order By ProductID , SalesDate
"""
df = pd.read_sql(sql_query, con)

df["cumuty"] = df["totalqty"].cumsum()

print(df.head())