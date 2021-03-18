import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt 
import seaborn as sns 
pd.set_option('display.max_rows',500)
pd.set_option('display.max_columns',500)
pd.set_option('display.width',1000)


class processing:
    def __init__(self,data):
        self.data=data

    def plot(self):
        print('\n')
        print('Dataset consist of {} rows and {} columns\n'.format(self.data.shape[0],self.data.shape[1]))
        print('\n_________________________________________Info______________________________\n')
        print(self.data.info())
        print('\n___________________________________________________________________________\n')
        # print(self.data.describe())
        print('Categorical columns plot\n')
        
        for i in self.data.columns:
            if self.data[i].dtypes==object:
                df=pd.DataFrame(self.data[i].value_counts().sort_values(ascending=False).head(10))
                plot1=df.plot(kind='bar',figsize=(12,8))
                plt.xlabel(i,fontsize=15)
                plt.ylabel('Frequency',fontsize=15)
                plt.yscale('log')
                plt.xticks(fontsize=12)
                plt.show(plot1)
                print("\n {} has {} unique values and {} percentage of null values \n".
                format(i,self.data[i].nunique(),round((self.data[i].isna().sum()/self.data.shape[0])*100,3)))
        print('Numerical columns plot\n')

        for i in self.data.columns:
            if self.data[i].dtypes!=object:
                print("\n {} has {} unique values and {} percentage of null values \n".format(i,self.data[i].nunique(),round((self.data[i].isna().sum()/self.data.shape[0])*100,3)))
                print("Note: Temporarily null values are filled with ffill for plotting")
                plt.figure(figsize=(12,8))
                df[i]=self.data[i].ffill()
                plot2= sns.distplot(df[i], bins = 25)
                plt.xlabel(i,fontsize=15)
                plt.ylabel('Frequency',fontsize=15)
                plt.yscale('log')
                plt.xticks(fontsize=12)
                plt.show(plot2)
               
        
        print("Heatmap for NA values")
        plt.figure(figsize=(12,9))
        plot3 = sns.heatmap(self.data.isnull(), cbar=False)
        plt.show(plot3)

df=pd.read_csv("E:/Machine Learning/Amazon_orders/amazon-orders.csv")
data=processing(df)
data.plot()
