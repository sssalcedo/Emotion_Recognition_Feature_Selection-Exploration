import csv
import numpy as np
import csv
import numpy as np
import pandas as pd
from sklearn import datasets

df = pd.read_csv('example-audio\emobase_acoustics_dutch.csv')

#df.reindex(columns=[*df.columns.tolist(), 'new_column1', 'new_column2'], fill_value=0)
def Convert(string):
    li = list(string.split(","))
    return li

reversed_range = range(88, 0, -1) 

for newcol in range(88):
    ncol = str(newcol)
    df[ncol]=np.nan
    print(ncol)

for i,h in zip(df['features'],range(742)):
    lis = Convert(i[:-1])
    list1 = [] 
    #print(lis,'list1')
    for j in lis:
        list1.append(j[2:-1])
    #print(list1,'list1')
    for k in reversed_range:
        ncl = str(k)
        df.loc[h,[ncl]] = list1[k-1]

print(df)

df.to_csv(r'C:\Users\jesus\Desktop\AMSTERDAM\psychology\Feature-Transformation\Output\emobase_acoustics_dutch.csv', index = False)

    

    
