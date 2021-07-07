import csv
import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler
df = pd.read_csv('ComParE_2016_acoustics_dutchFemale.csv')
  
scaler = MinMaxScaler()
scaler.fit(df)
newdf = scaler.transform(df)


pd.DataFrame(newdf).to_csv("Output\ComParE_2016_Scaled_dutchFemale.csv")




    
