import pandas as pd
from matplotlib.pyplot import pie, axis, show
import matplotlib.pyplot as plt
import numpy as np

#PIE CHART

df = pd.read_csv ('Dati/RunChart/CyberSec/Settori/InterFin.csv')
df1 = pd.read_csv ('Dati/RunChart/CyberSec/Settori/IstrUni.csv')
df2 = pd.read_csv ('Dati/RunChart/CyberSec/Settori/PC.csv')
df3 = pd.read_csv('Dati/RunChart/CyberSec/Settori/ProdSoft.csv')
df4 = pd.read_csv('Dati/RunChart/CyberSec/Settori/PubblAmm.csv')


#  RUN CHART


def barre(ascissa,ordinata):
    x_pos = np.arange(len(ascissa))
    plt.bar(x_pos, ordinata, align='center')
    plt.xticks(x_pos, ascissa)
    plt.ylabel('Cardinalità')
    plt.xlabel('Settori')
    plt.title('Altri settori')
    plt.show()

def pie_chart(df):
    sums = df.groupby(df["descrizione"])["cardinalita"].sum()
    axis('equal')
    plt.pie(sums, labels=sums.index,autopct='%1.1f%%')
    plt.show()

def run_chart(df,df1,df2,df3,df4):
    plt.plot(df['anno'],df['valore'])
    plt.plot(df1['anno'],df1['valore'])
    plt.plot(df2['anno'],df2['valore'])
    plt.plot(df3['anno'],df3['valore'])
    plt.plot(df4['anno'],df4['valore'])
    plt.legend(['Intermediazioni Finanziarie','Università','Fabbricazione di apparecchiature elettroniche',
                'Produzione software','Pubblica Amministrazione'])
    plt.xticks(range(2014,2021))
    plt.title('Run chart')
    plt.xlabel('Anno')
    plt.ylabel('Numero')
    plt.show()

run_chart(df,df1,df2,df3,df4)

