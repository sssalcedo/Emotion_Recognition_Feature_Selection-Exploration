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
eGeMAPSv01b = pd.read_csv('inputs/emobase_acoustics_dutchFemales.csv')
#X matrix
matrix = eGeMAPSv01b.drop("Emotion_Category",1)   #Feature Matrix
#y labels
labels = eGeMAPSv01b["Emotion_Category"]          #Target Variable
eGeMAPSv01b.head()
print(matrix,'matrix')

print(labels,'labels')


#print("Score with %d features: %f" % (nof, high_score))

reg = LassoCV()
reg.fit(matrix, labels)
print("Best alpha using built-in LassoCV: %f" % reg.alpha_)
print("Best score using built-in LassoCV: %f" %reg.score(matrix,labels))
coef = pd.Series(reg.coef_, index = matrix.columns)
print("Lasso picked " + str(sum(coef != 0)) + " variables and eliminated the other " +  str(sum(coef == 0)) + " variables")


imp_coef = coef.sort_values()
import matplotlib
matplotlib.rcParams['figure.figsize'] = (8.0, 10.0)
imp_coef.plot(kind = "barh")
plt.title("Feature importance using Lasso Model")
