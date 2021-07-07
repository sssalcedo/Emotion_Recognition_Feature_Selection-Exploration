#fileformat example: p1_amae.txt
import os
import re
import numpy as np
import pandas as pd

import csv
df = pd.read_csv('eGeMAPSv01b_acoustic_dutchFemales.csv')

# updating the column value/data
df['Emotion_Category'] = df['Emotion_Category'].replace({'admiration':1})
df['Emotion_Category'] = df['Emotion_Category'].replace({'amae':2})
df['Emotion_Category'] = df['Emotion_Category'].replace({'amusement':3})
df['Emotion_Category'] = df['Emotion_Category'].replace({'amusementwav':3})
df['Emotion_Category'] = df['Emotion_Category'].replace({'amusment':3})
df['Emotion_Category'] = df['Emotion_Category'].replace({'amusemet':3})
df['Emotion_Category'] = df['Emotion_Category'].replace({'amusem':3})
df['Emotion_Category'] = df['Emotion_Category'].replace({'laugh':3})
df['Emotion_Category'] = df['Emotion_Category'].replace({'awe':4})
df['Emotion_Category'] = df['Emotion_Category'].replace({'determination':5})
df['Emotion_Category'] = df['Emotion_Category'].replace({'determinatino':5})
df['Emotion_Category'] = df['Emotion_Category'].replace({'elation':6})
df['Emotion_Category'] = df['Emotion_Category'].replace({'elat':6})
df['Emotion_Category'] = df['Emotion_Category'].replace({'la':6})
df['Emotion_Category'] = df['Emotion_Category'].replace({'euphoria':6})
df['Emotion_Category'] = df['Emotion_Category'].replace({'elevation':7})
df['Emotion_Category'] = df['Emotion_Category'].replace({'excitement':8})
df['Emotion_Category'] = df['Emotion_Category'].replace({'gratitude':9})
df['Emotion_Category'] = df['Emotion_Category'].replace({'hope':10})
df['Emotion_Category'] = df['Emotion_Category'].replace({'inspiration':11})
df['Emotion_Category'] = df['Emotion_Category'].replace({'interest':12})
df['Emotion_Category'] = df['Emotion_Category'].replace({'fascinatie':12})
df['Emotion_Category'] = df['Emotion_Category'].replace({'interested':12})
df['Emotion_Category'] = df['Emotion_Category'].replace({'lust':13})
df['Emotion_Category'] = df['Emotion_Category'].replace({'moved':14})
df['Emotion_Category'] = df['Emotion_Category'].replace({'mo':14})
df['Emotion_Category'] = df['Emotion_Category'].replace({'positivesurprise':15})
df['Emotion_Category'] = df['Emotion_Category'].replace({'positivesuprise':15})
df['Emotion_Category'] = df['Emotion_Category'].replace({'possurprise':15})
df['Emotion_Category'] = df['Emotion_Category'].replace({'possuprise':15})
df['Emotion_Category'] = df['Emotion_Category'].replace({'pride':16})
df['Emotion_Category'] = df['Emotion_Category'].replace({'relief':17})
df['Emotion_Category'] = df['Emotion_Category'].replace({'respected':18})
df['Emotion_Category'] = df['Emotion_Category'].replace({'respec':18})
df['Emotion_Category'] = df['Emotion_Category'].replace({'schanfreude':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'schadenfreude':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'schadenfrude':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'schanfruede':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'malaciousjoy':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'maliciousjoy':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'malicious':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'malicioursjoy':19})
df['Emotion_Category'] = df['Emotion_Category'].replace({'senspleasure':20})
df['Emotion_Category'] = df['Emotion_Category'].replace({'sensualpleasure':20})
df['Emotion_Category'] = df['Emotion_Category'].replace({'sensualpleasure':20})
df['Emotion_Category'] = df['Emotion_Category'].replace({'senspleas':20})
df['Emotion_Category'] = df['Emotion_Category'].replace({'tenderness':21})
df['Emotion_Category'] = df['Emotion_Category'].replace({'tederness':21})
df['Emotion_Category'] = df['Emotion_Category'].replace({'triumph':22})
df['Emotion_Category'] = df['Emotion_Category'].replace({'triu':22})

print(df)

df.to_csv(r'C:\Users\jesus\Desktop\AMSTERDAM\psychology\Feature-Transformation\Output\eGeMAPSv01b_Numeric_dutchFemales.csv', index = False)
