import pandas as pd

def get_table(path):
    df=pd.read_csv('tableload.txt',sep=':')
    return df.query("to_load=='yes'")