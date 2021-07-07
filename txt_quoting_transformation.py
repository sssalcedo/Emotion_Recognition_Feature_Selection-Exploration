import csv
df = pd.read_csv('eGeMAPSv01b_acoustics_dutchFemales.csv')
  
df.update('"' + df[['Emotion_Category']].astype(str) + '"')


df.to_csv(r'C:\Users\jesus\Desktop\AMSTERDAM\psychology\Feature-Extraction\opensmile-3.0-win-x64\opensmile-3.0-win-x64\example-audio\eGeMAPSv01b_quoted_dutchFemales.csv', index = False)




    
