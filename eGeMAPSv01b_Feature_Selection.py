#importing libraries
from sklearn.datasets import load_boston
import pandas as pd
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
import statsmodels.api as sm

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.feature_selection import RFE
from sklearn.linear_model import RidgeCV, LassoCV, Ridge, Lasso
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

#Adding constant column of ones, mandatory for sm.OLS model
X_1 = sm.add_constant(matrix)
#Fitting sm.OLS model
model = sm.OLS(labels,X_1).fit()
model.pvalues

#Backward Elimination
cols = list(matrix.columns)
pmax = 1
while (len(cols)>0):
    p= []
    X_1 = matrix[cols]
    X_1 = sm.add_constant(X_1)
    model = sm.OLS(labels,X_1).fit()
    p = pd.Series(model.pvalues.values[1:],index = cols)      
    pmax = max(p)
    feature_with_p_max = p.idxmax()
    if(pmax>0.05):
        cols.remove(feature_with_p_max)
    else:
        break
selected_features_BE = cols
print(selected_features_BE,'selected_features_BE')


model = LinearRegression()
#Initializing RFE model
rfe = RFE(model, 7)
#Transforming data using RFE
X_rfe = rfe.fit_transform(matrix,labels)  
#Fitting the data to model
model.fit(X_rfe,labels)
print(rfe.support_)
print(rfe.ranking_)

#no of features
nof_list=np.arange(1,13)            
high_score=0
#Variable to store the optimum features
nof=0           
score_list =[]
for n in range(len(nof_list)):
    X_train, X_test, y_train, y_test = train_test_split(matrix,labels, test_size = 0.3, random_state = 0)
    model = LinearRegression()
    rfe = RFE(model,nof_list[n])
    X_train_rfe = rfe.fit_transform(X_train,y_train)
    X_test_rfe = rfe.transform(X_test)
    model.fit(X_train_rfe,y_train)
    score = model.score(X_test_rfe,y_test)
    score_list.append(score)
    if(score>high_score):
        high_score = score
        nof = nof_list[n]
print("Optimum number of features: %d" %nof)
print("Score with %d features: %f" % (nof, high_score))

cols = list(matrix.columns)
model = LinearRegression()
#Initializing RFE model
rfe = RFE(model, 10)             
#Transforming data using RFE
X_rfe = rfe.fit_transform(matrix,labels)  
#Fitting the data to model
model.fit(X_rfe,labels)              
temp = pd.Series(rfe.support_,index = cols)
selected_features_rfe = temp[temp==True].index
print(selected_features_rfe)
