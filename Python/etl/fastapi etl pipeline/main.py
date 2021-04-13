from fastapi import FastAPI
import pandas as pd
import os
base_dir=os.path.dirname(os.path.abspath(__file__))
print(base_dir)
cache_dir=os.path.join(base_dir,'cache')
print(cache_dir)
dataset=os.path.join(cache_dir,'final_movies.csv')
print(dataset)

app=FastAPI()

@app.get('/')
def read_root():
    return {'Hello':"world"}

@app.get("/box-office")
def read_box_office():
    df=pd.read_csv(dataset)
    return df.to_dict('Rank')