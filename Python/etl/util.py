import pandas as pd
from config import db_details
import pymysql

def load_db_details(env):
    return db_details[env]

def sql_connect(name,user,passw):
     connection=pymysql.connect(database=name,user=user,password=passw)
     return connection

def get_table(path):
    df=pd.read_csv('tableload.txt',sep=':')
    return df.query("to_load=='yes'")



# con=sql_connect()
# print(type(con))