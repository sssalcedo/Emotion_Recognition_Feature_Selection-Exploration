#importing libraries
#Load needed libraries
from sklearn.datasets import load_boston
from mlxtend.feature_selection import SequentialFeatureSelector as SFS
from sklearn.linear_model import LinearRegression
import pandas as pd
import numpy as np


#Loading the dataset
#df
eGeMAPSv01b = pd.read_csv('inputs-trimed/Groups_Trimed_eGeMAPSv01b_acoustics.csv')
#X matrix
matrix = eGeMAPSv01b.drop("Emotion_Category",1)   #Feature Matrix
#y labels
labels = eGeMAPSv01b["Emotion_Category"]          #Target Variable
eGeMAPSv01b.head()
print(matrix,'matrix')

print(labels,'labels')

# load_boston() sklearn dataset to boston
boston = load_boston()

# use np.c_ to concatenate into a dataframe
df = pd.DataFrame(boston.data, columns=boston.feature_names)
df['PRICE'] = pd.Series(boston.target)
print(df,'df')
#Split the features and target data
#select the first 13 columns as features
X = df.iloc[:,:13]
#Select the last column for target 
y = df.iloc[:,-1]
print(y,'y')
#Define Sequential Forward Selection (sfs)
sfs = SFS(LinearRegression(),
           k_features=5,
           forward=True,
           floating=False,
           scoring = 'r2',
           cv = 0)
#Use SFS to select the top 5 features 
#sfs.fit(matrix, labels)
sfs.fit(X, y)
#Create a dataframe for the SFS results 
df_SFS_results = pd.DataFrame(sfs.subsets_).transpose()

pd.set_option("display.max_rows", None, "display.max_columns", None)

#print(df_SFS_results)

#print(df_SFS_results['Item'])
print(df_SFS_results,'df_SFS_results')